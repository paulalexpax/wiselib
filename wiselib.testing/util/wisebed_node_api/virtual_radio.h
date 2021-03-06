/***************************************************************************
 ** This file is part of the generic algorithm library Wiselib.           **
 ** Copyright (C) 2008,2009 by the Wisebed (www.wisebed.eu) project.      **
 **                                                                       **
 ** The Wiselib is free software: you can redistribute it and/or modify   **
 ** it under the terms of the GNU Lesser General Public License as        **
 ** published by the Free Software Foundation, either version 3 of the    **
 ** License, or (at your option) any later version.                       **
 **                                                                       **
 ** The Wiselib is distributed in the hope that it will be useful,        **
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of        **
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         **
 ** GNU Lesser General Public License for more details.                   **
 **                                                                       **
 ** You should have received a copy of the GNU Lesser General Public      **
 ** License along with the Wiselib.                                       **
 ** If not, see <http://www.gnu.org/licenses/>.                           **
 ***************************************************************************/
#ifndef __UTIL_WISEBED_NODE_API_VIRTUAL_RADIO_MODEL_H
#define __UTIL_WISEBED_NODE_API_VIRTUAL_RADIO_MODEL_H

#include "util/wisebed_node_api/response_types.h"
#include "util/wisebed_node_api/command_types.h"
#include "util/wisebed_node_api/virtual_link_in_message.h"
#include "util/wisebed_node_api/virtual_link_out_message.h"
#include "util/delegates/delegate.hpp"
#include "util/serialization/simple_types.h"
#include "util/pstl/vector_static.h"
#include "util/pstl/pair.h"
#include "config_testing.h"
#include <stdint.h>

namespace wiselib
{

   /** \brief Virtual Radio Implementation of \ref radio_concept "Radio Concept"
    *  \ingroup radio_concept
    *
    *  Virtual Radio implementation of the \ref radio_concept "Radio concept" ...
    */
   template<typename OsModel_P,
            typename Radio_P,
            typename Uart_P,
            typename Debug_P = typename OsModel_P::Debug,
            int MAX_VIRTUAL_LINKS = 10>
   class VirtualRadioModel
   {
   public:
      typedef OsModel_P OsModel;
      typedef Radio_P Radio;
      typedef Uart_P Uart;
      typedef Debug_P Debug;
      typedef VirtualRadioModel<OsModel, Radio, Uart, Debug, MAX_VIRTUAL_LINKS> self_type;
      typedef self_type* self_pointer_t;

      typedef VirtualLinkInMessage<OsModel, Radio> InMessage;
      typedef VirtualLinkOutMessage<OsModel, Radio> OutMessage;

      typedef typename Radio::node_id_t node_id_t;
      typedef typename Radio::size_t size_t;
      typedef typename Radio::block_data_t block_data_t;
      typedef typename Radio::message_id_t message_id_t;

      typedef typename Radio::radio_delegate_t radio_delegate_t;
      // typedef typename Radio::extended_radio_delegate_t extended_radio_delegate_iss_t;

      typedef vector_static<OsModel, radio_delegate_t, 10> Receivers;
      typedef typename Receivers::iterator ReceiversIterator;

      typedef vector_static<OsModel, node_id_t, 10> DestinationVector;
      typedef typename DestinationVector::iterator DestinationVectorIterator;

      typedef vector_static<OsModel, node_id_t, 10> DeadLinksVector;
      typedef typename DeadLinksVector::iterator DeadLinksVectorIterator;
      // --------------------------------------------------------------------
      Receivers receivers_;
      DestinationVector destinations_;
      DeadLinksVector deadlinks_;

      bool nodeactive_;
      node_id_t virtual_node_id_;
      // --------------------------------------------------------------------
      enum SpecialNodeIds
      {
         BROADCAST_ADDRESS = Radio::BROADCAST_ADDRESS, ///< All nodes in communication range
         NULL_NODE_ID      = Radio::NULL_NODE_ID       ///< Unknown/No node id
      };
      // --------------------------------------------------------------------
      enum Restrictions
      {
         MAX_MESSAGE_LENGTH = Radio::MAX_MESSAGE_LENGTH ///< Maximal number of bytes in payload
      };
      // --------------------------------------------------------------------
      void init( Radio& radio, Uart& uart, Debug& debug )
      {
         radio_ = &radio;
         uart_ = &uart;
         debug_ = &debug;
      }
      // --------------------------------------------------------------------
      void destruct()
      {}
      // --------------------------------------------------------------------
      void send( node_id_t to, size_t len, block_data_t *buf )
      {
         // send virtual link message over uart
         if ((nodeactive_ == true) && (!destinations_.empty() ))
         {
            OutMessage message;
            message.set_command_type( NODE_OUTPUT_VIRTUAL_LINK );
            message.set_destination( to );
            message.set_source( id() );
            message.set_rssi( 0 );
            message.set_lqi( 0 );
            message.set_payload( len, buf );
            uart().write( message.buffer_size(), (uint8_t*)(&message) );
#ifdef VIRTUAL_RADIO_DEBUG
            debug().debug( "SENT to uart!" );
#endif
         }
         else
         {
#ifdef VIRTUAL_RADIO_DEBUG
            debug().debug( "NOT sent to uart, dests empty!" );
#endif
         }

         // send message over physical radio
         if ((nodeactive_ == true) && (node_in_deadlink_vector(to) == false))
         {
            radio().send( to, len, buf );
#ifdef VIRTUAL_RADIO_DEBUG
            debug().debug("Send to %d (len %d)", to, len);
#endif
         }
         else
         {
#ifdef VIRTUAL_RADIO_DEBUG
            debug().debug( "NOT sent to radio, node in deadlink vector!" );
#endif
         }
      };
      // --------------------------------------------------------------------
      void
      receive_message( node_id_t id, size_t len, block_data_t *buf )
      {
#ifdef VIRTUAL_RADIO_DEBUG
         debug().debug("Received from %d (len %d)", id, len);
#endif
         for ( ReceiversIterator
                  it = receivers_.begin();
                  it != receivers_.end();
                  ++it )
            (*it)( id, len, buf );
      }
      // --------------------------------------------------------------------
      void set_virtual_link( block_data_t* data)
      {
         uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data );
         node_id_t dest = read<OsModel, block_data_t, uint64_t>( data +1);
         destinations_.push_back( dest );
#ifdef VIRTUAL_RADIO_DEBUG
         debug().debug( "Set vlink to %d\n", (uint16_t)dest );
#endif

         send_response_message(SET_VIRTUAL_LINK, request_id, COMMAND_SUCCESS, 0, NULL);
      }
      // --------------------------------------------------------------------
      void destroy_virtual_link( block_data_t* data)
      {
          uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data );
          node_id_t dest = read<OsModel, block_data_t, uint64_t>( data +1);
#ifdef VIRTUAL_RADIO_DEBUG
         debug().debug( "Destroy vlink to %d\n", (uint16_t)dest );
#endif
          
          for ( DestinationVectorIterator it = destinations_.begin(); it != destinations_.begin(); ++it )
          {
             if ( *it == dest )
                destinations_.erase( it );
          }

         send_response_message(DESTROY_VIRTUAL_LINK, request_id, COMMAND_SUCCESS, 0, NULL);
      }
      // --------------------------------------------------------------------
      void enable_physical_link( block_data_t* data)
      {
         uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data );
         node_id_t dest = read<OsModel, block_data_t, uint64_t>( data +1);

          for ( DeadLinksVectorIterator it = deadlinks_.begin(); it != deadlinks_.begin(); ++it )
          {
             if ( *it == dest )
                deadlinks_.erase( it );
          }

         send_response_message(ENABLE_PHYSICAL_LINK, request_id, COMMAND_SUCCESS, 0, NULL);
      }
      // --------------------------------------------------------------------
      void disable_physical_link( block_data_t* data)
      {
         uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data );
         node_id_t dest = read<OsModel, block_data_t, uint64_t>( data +1);

         deadlinks_.push_back( dest );

         send_response_message(DISABLE_PHYSICAL_LINK, request_id, COMMAND_SUCCESS, 0, NULL);
      }
      // --------------------------------------------------------------------
      bool node_in_deadlink_vector( node_id_t dest )
      {
          for ( DeadLinksVectorIterator it = deadlinks_.begin(); it != deadlinks_.begin(); ++it )
          {
             if ( *it == dest )
                return true;
          }

         return false;
      }
      // --------------------------------------------------------------------
      void enable_node( block_data_t* data)
      {
         uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data );

         nodeactive_ = true;

         send_response_message(ENABLE_NODE, request_id, COMMAND_SUCCESS, 0, NULL);
      }
      // --------------------------------------------------------------------
      void disable_node( block_data_t* data)
      {
         uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data );

         nodeactive_ = false;

         send_response_message(DISABLE_NODE, request_id, COMMAND_SUCCESS, 0, NULL);
      }
      // --------------------------------------------------------------------
      void rcv_uart_packet( typename Uart::size_t len,
                            typename Uart::block_data_t* data )
      {
#ifdef VIRTUAL_RADIO_DEBUG
         debug().debug( "Rcvd via UART\n" );
#endif
         switch (*data)
         {
            case VIRTUAL_LINK_MESSAGE:
            {
               InMessage *msg = (InMessage*)data;
#ifdef VIRTUAL_RADIO_DEBUG
               debug().debug( "RECEIVED VIRTUAL LINK from %d to %d with size %d\n",
                  (uint32_t)msg->source(), (uint32_t)msg->destination(), msg->payload_length() );
#endif

               if ( msg->destination() == radio().id() ||
                     msg->destination() == Radio::BROADCAST_ADDRESS )
                  receive_message( msg->source(), msg->payload_length(), msg->payload() );

               send_response_message(VIRTUAL_LINK_MESSAGE, msg->request_id(), COMMAND_SUCCESS, 0, NULL);

               break;
            }
            case ENABLE_NODE:
               enable_node( data + sizeof(block_data_t));
               break;
            case DISABLE_NODE:
               disable_node( data + sizeof(block_data_t));
               break;
            case SET_VIRTUAL_LINK:
               set_virtual_link( data + sizeof(block_data_t));
               break;
            case DESTROY_VIRTUAL_LINK:
               destroy_virtual_link( data + sizeof(block_data_t));
               break;
            case ENABLE_PHYSICAL_LINK:
               enable_physical_link( data + sizeof(block_data_t));
               break;
            case DISABLE_PHYSICAL_LINK:
               disable_physical_link( data + sizeof(block_data_t));
               break;
            default:
               uint8_t command_type = read<OsModel, block_data_t, uint8_t>( data );
               uint8_t request_id = read<OsModel, block_data_t, uint8_t>( data +1);
               send_response_message(command_type, request_id, UNKNOWN_PARAMETER, 0, NULL);
               break;
         }
      }
      // --------------------------------------------------------------------
      void send_response_message( uint8_t command_type, uint8_t request_id,
                                  uint8_t result, uint8_t len, block_data_t* payload)
      {
         uint8_t buf_len = 3+len;
         uint8_t uart_buf[buf_len];

         uart_buf[0] = command_type;
         uart_buf[1] = request_id;
         uart_buf[2] = result;

         memcpy( uart_buf + 3, payload, len);

         uart().write( buf_len, (uint8_t*)(&uart_buf) );
      }
      // --------------------------------------------------------------------
      void enable_radio()
      {
         nodeactive_ = true;
         virtual_node_id_ = radio().id();

         radio().enable_radio();
         radio().template reg_recv_callback<self_type, &self_type::receive_message>(this);
         uart().enable_serial_comm();
         uart().template reg_read_callback<self_type, &self_type::rcv_uart_packet>(this);
      }
      // --------------------------------------------------------------------
      void disable_radio()
      {
         nodeactive_ = false;

         uart().disable_serial_comm();
         radio().disable_radio();
      }
      // --------------------------------------------------------------------
      node_id_t id()
      {
         return radio().id();
      }
      // --------------------------------------------------------------------
      template<class T, void (T::*TMethod)( node_id_t, size_t, block_data_t* )>
      int reg_recv_callback( T *obj_pnt )
      {
         receivers_.push_back( radio_delegate_t::template from_method<T, TMethod>( obj_pnt ) );
         // TODO: return real id!
         return 0;
      }
      // --------------------------------------------------------------------
      void unreg_recv_callback( int idx )
      {}

   private:
      Radio& radio()
      { return *radio_; }

      Uart& uart()
      { return *uart_; }

      Debug& debug()
      { return *debug_; }

      Radio* radio_;
      Uart* uart_;
      Debug* debug_;
   };
}

#endif
