/***************************************************************************
 ** This file is part of the generic algorithm library Wiselib.           **
 ** Copyright (C) 2012 by the Wisebed (www.wisebed.eu) project.           **
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
#ifndef __ARDUINO_OS_MODEL_H__
#define __ARDUINO_OS_MODEL_H__

#include <assert.h>
#define DBG(X) ArduinoDebug<ArduinoOsModel>(true).debug(X)
#define DBG(X, ...) ArduinoDebug<ArduinoOsModel>(true).debug(X, __VA_ARGS__)

#include "external_interface/default_return_values.h"
#include "external_interface/arduino/arduino_debug.h"
#include "external_interface/arduino/arduino_clock.h"
#include "external_interface/arduino/arduino_sdcard.h"
#include "external_interface/arduino/arduino_ethernet_radio.h"
#include "external_interface/arduino/arduino_bluetooth_radio.h"
#include "external_interface/arduino/arduino_timer.h"
#include "util/serialization/endian.h"

/*routes the assert() error message into STDERR, TODO: route STDERR to the 
serial port so that you can actually output the messages*/
#define __ASSERT_USE_STDERR 

namespace wiselib
{

   /** \brief Arduino implementation of \ref os_concept "Os Concept".
    *
    *  \ingroup os_concept
    *  \ingroup basic_return_values_concept
    *  \ingroup arduino_facets
    */
   class ArduinoOsModel
      : public DefaultReturnValues<ArduinoOsModel>
   {
   public:
      typedef ArduinoOsModel AppMainParameter;

      typedef ::uint32_t size_t;
      typedef uint8_t block_data_t;

      typedef ArduinoDebug<ArduinoOsModel> Debug;
      typedef ArduinoClock<ArduinoOsModel> Clock;
      typedef ArduinoTimer<ArduinoOsModel> Timer;
#if ARDUINO_USE_ETHERNET
      typedef ArduinoEthernetRadio<ArduinoOsModel> EthernetRadio;
	  typedef EthernetRadio Radio;
#endif
#if ARDUINO_USE_BLUETOOTH
      typedef ArduinoBluetoothRadio<ArduinoOsModel> BluetoothRadio;
#endif
 
      typedef ArduinoSdCard<ArduinoOsModel> BlockMemory;

      static const Endianness endianness = WISELIB_ENDIANNESS;
   };

}

#endif
