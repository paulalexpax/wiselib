// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Messages.pb.h"

@implementation MessagesRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [MessagesRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface Msg ()
@property (retain) NSString* to;
@property (retain) NSString* from;
@property (retain) NSString* msgType;
@property uint32_t priority;
@property uint64_t validUntil;
@property (retain) NSData* payload;
@property (retain) NSString* replyWith;
@property (retain) NSString* replyTo;
@end

@implementation Msg

- (BOOL) hasTo {
  return !!hasTo_;
}
- (void) setHasTo:(BOOL) value {
  hasTo_ = !!value;
}
@synthesize to;
- (BOOL) hasFrom {
  return !!hasFrom_;
}
- (void) setHasFrom:(BOOL) value {
  hasFrom_ = !!value;
}
@synthesize from;
- (BOOL) hasMsgType {
  return !!hasMsgType_;
}
- (void) setHasMsgType:(BOOL) value {
  hasMsgType_ = !!value;
}
@synthesize msgType;
- (BOOL) hasPriority {
  return !!hasPriority_;
}
- (void) setHasPriority:(BOOL) value {
  hasPriority_ = !!value;
}
@synthesize priority;
- (BOOL) hasValidUntil {
  return !!hasValidUntil_;
}
- (void) setHasValidUntil:(BOOL) value {
  hasValidUntil_ = !!value;
}
@synthesize validUntil;
- (BOOL) hasPayload {
  return !!hasPayload_;
}
- (void) setHasPayload:(BOOL) value {
  hasPayload_ = !!value;
}
@synthesize payload;
- (BOOL) hasReplyWith {
  return !!hasReplyWith_;
}
- (void) setHasReplyWith:(BOOL) value {
  hasReplyWith_ = !!value;
}
@synthesize replyWith;
- (BOOL) hasReplyTo {
  return !!hasReplyTo_;
}
- (void) setHasReplyTo:(BOOL) value {
  hasReplyTo_ = !!value;
}
@synthesize replyTo;
- (void) dealloc {
  self.to = nil;
  self.from = nil;
  self.msgType = nil;
  self.payload = nil;
  self.replyWith = nil;
  self.replyTo = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.to = @"";
    self.from = @"";
    self.msgType = @"";
    self.priority = 0;
    self.validUntil = 0L;
    self.payload = [NSData data];
    self.replyWith = @"";
    self.replyTo = @"";
  }
  return self;
}
static Msg* defaultMsgInstance = nil;
+ (void) initialize {
  if (self == [Msg class]) {
    defaultMsgInstance = [[Msg alloc] init];
  }
}
+ (Msg*) defaultInstance {
  return defaultMsgInstance;
}
- (Msg*) defaultInstance {
  return defaultMsgInstance;
}
- (BOOL) isInitialized {
  if (!self.hasTo) {
    return NO;
  }
  if (!self.hasFrom) {
    return NO;
  }
  if (!self.hasMsgType) {
    return NO;
  }
  if (!self.hasPriority) {
    return NO;
  }
  if (!self.hasValidUntil) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasTo) {
    [output writeString:1 value:self.to];
  }
  if (self.hasFrom) {
    [output writeString:2 value:self.from];
  }
  if (self.hasMsgType) {
    [output writeString:3 value:self.msgType];
  }
  if (self.hasPriority) {
    [output writeUInt32:4 value:self.priority];
  }
  if (self.hasValidUntil) {
    [output writeUInt64:5 value:self.validUntil];
  }
  if (self.hasPayload) {
    [output writeData:6 value:self.payload];
  }
  if (self.hasReplyWith) {
    [output writeString:7 value:self.replyWith];
  }
  if (self.hasReplyTo) {
    [output writeString:8 value:self.replyTo];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasTo) {
    size += computeStringSize(1, self.to);
  }
  if (self.hasFrom) {
    size += computeStringSize(2, self.from);
  }
  if (self.hasMsgType) {
    size += computeStringSize(3, self.msgType);
  }
  if (self.hasPriority) {
    size += computeUInt32Size(4, self.priority);
  }
  if (self.hasValidUntil) {
    size += computeUInt64Size(5, self.validUntil);
  }
  if (self.hasPayload) {
    size += computeDataSize(6, self.payload);
  }
  if (self.hasReplyWith) {
    size += computeStringSize(7, self.replyWith);
  }
  if (self.hasReplyTo) {
    size += computeStringSize(8, self.replyTo);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Msg*) parseFromData:(NSData*) data {
  return (Msg*)[[[Msg builder] mergeFromData:data] build];
}
+ (Msg*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Msg*)[[[Msg builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Msg*) parseFromInputStream:(NSInputStream*) input {
  return (Msg*)[[[Msg builder] mergeFromInputStream:input] build];
}
+ (Msg*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Msg*)[[[Msg builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Msg*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Msg*)[[[Msg builder] mergeFromCodedInputStream:input] build];
}
+ (Msg*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Msg*)[[[Msg builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Msg_Builder*) builder {
  return [[[Msg_Builder alloc] init] autorelease];
}
+ (Msg_Builder*) builderWithPrototype:(Msg*) prototype {
  return [[Msg builder] mergeFrom:prototype];
}
- (Msg_Builder*) builder {
  return [Msg builder];
}
@end

@interface Msg_Builder()
@property (retain) Msg* result;
@end

@implementation Msg_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Msg alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Msg_Builder*) clear {
  self.result = [[[Msg alloc] init] autorelease];
  return self;
}
- (Msg_Builder*) clone {
  return [Msg builderWithPrototype:result];
}
- (Msg*) defaultInstance {
  return [Msg defaultInstance];
}
- (Msg*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Msg*) buildPartial {
  Msg* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Msg_Builder*) mergeFrom:(Msg*) other {
  if (other == [Msg defaultInstance]) {
    return self;
  }
  if (other.hasTo) {
    [self setTo:other.to];
  }
  if (other.hasFrom) {
    [self setFrom:other.from];
  }
  if (other.hasMsgType) {
    [self setMsgType:other.msgType];
  }
  if (other.hasPriority) {
    [self setPriority:other.priority];
  }
  if (other.hasValidUntil) {
    [self setValidUntil:other.validUntil];
  }
  if (other.hasPayload) {
    [self setPayload:other.payload];
  }
  if (other.hasReplyWith) {
    [self setReplyWith:other.replyWith];
  }
  if (other.hasReplyTo) {
    [self setReplyTo:other.replyTo];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Msg_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Msg_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setTo:[input readString]];
        break;
      }
      case 18: {
        [self setFrom:[input readString]];
        break;
      }
      case 26: {
        [self setMsgType:[input readString]];
        break;
      }
      case 32: {
        [self setPriority:[input readUInt32]];
        break;
      }
      case 40: {
        [self setValidUntil:[input readUInt64]];
        break;
      }
      case 50: {
        [self setPayload:[input readData]];
        break;
      }
      case 58: {
        [self setReplyWith:[input readString]];
        break;
      }
      case 66: {
        [self setReplyTo:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasTo {
  return result.hasTo;
}
- (NSString*) to {
  return result.to;
}
- (Msg_Builder*) setTo:(NSString*) value {
  result.hasTo = YES;
  result.to = value;
  return self;
}
- (Msg_Builder*) clearTo {
  result.hasTo = NO;
  result.to = @"";
  return self;
}
- (BOOL) hasFrom {
  return result.hasFrom;
}
- (NSString*) from {
  return result.from;
}
- (Msg_Builder*) setFrom:(NSString*) value {
  result.hasFrom = YES;
  result.from = value;
  return self;
}
- (Msg_Builder*) clearFrom {
  result.hasFrom = NO;
  result.from = @"";
  return self;
}
- (BOOL) hasMsgType {
  return result.hasMsgType;
}
- (NSString*) msgType {
  return result.msgType;
}
- (Msg_Builder*) setMsgType:(NSString*) value {
  result.hasMsgType = YES;
  result.msgType = value;
  return self;
}
- (Msg_Builder*) clearMsgType {
  result.hasMsgType = NO;
  result.msgType = @"";
  return self;
}
- (BOOL) hasPriority {
  return result.hasPriority;
}
- (uint32_t) priority {
  return result.priority;
}
- (Msg_Builder*) setPriority:(uint32_t) value {
  result.hasPriority = YES;
  result.priority = value;
  return self;
}
- (Msg_Builder*) clearPriority {
  result.hasPriority = NO;
  result.priority = 0;
  return self;
}
- (BOOL) hasValidUntil {
  return result.hasValidUntil;
}
- (uint64_t) validUntil {
  return result.validUntil;
}
- (Msg_Builder*) setValidUntil:(uint64_t) value {
  result.hasValidUntil = YES;
  result.validUntil = value;
  return self;
}
- (Msg_Builder*) clearValidUntil {
  result.hasValidUntil = NO;
  result.validUntil = 0L;
  return self;
}
- (BOOL) hasPayload {
  return result.hasPayload;
}
- (NSData*) payload {
  return result.payload;
}
- (Msg_Builder*) setPayload:(NSData*) value {
  result.hasPayload = YES;
  result.payload = value;
  return self;
}
- (Msg_Builder*) clearPayload {
  result.hasPayload = NO;
  result.payload = [NSData data];
  return self;
}
- (BOOL) hasReplyWith {
  return result.hasReplyWith;
}
- (NSString*) replyWith {
  return result.replyWith;
}
- (Msg_Builder*) setReplyWith:(NSString*) value {
  result.hasReplyWith = YES;
  result.replyWith = value;
  return self;
}
- (Msg_Builder*) clearReplyWith {
  result.hasReplyWith = NO;
  result.replyWith = @"";
  return self;
}
- (BOOL) hasReplyTo {
  return result.hasReplyTo;
}
- (NSString*) replyTo {
  return result.replyTo;
}
- (Msg_Builder*) setReplyTo:(NSString*) value {
  result.hasReplyTo = YES;
  result.replyTo = value;
  return self;
}
- (Msg_Builder*) clearReplyTo {
  result.hasReplyTo = NO;
  result.replyTo = @"";
  return self;
}
@end

@interface SingleRequestMultipleResponseRequest ()
@property (retain) NSString* requestId;
@property BOOL reliableRequest;
@property BOOL reliableResponses;
@property (retain) NSData* payload;
@end

@implementation SingleRequestMultipleResponseRequest

- (BOOL) hasRequestId {
  return !!hasRequestId_;
}
- (void) setHasRequestId:(BOOL) value {
  hasRequestId_ = !!value;
}
@synthesize requestId;
- (BOOL) hasReliableRequest {
  return !!hasReliableRequest_;
}
- (void) setHasReliableRequest:(BOOL) value {
  hasReliableRequest_ = !!value;
}
- (BOOL) reliableRequest {
  return !!reliableRequest_;
}
- (void) setReliableRequest:(BOOL) value {
  reliableRequest_ = !!value;
}
- (BOOL) hasReliableResponses {
  return !!hasReliableResponses_;
}
- (void) setHasReliableResponses:(BOOL) value {
  hasReliableResponses_ = !!value;
}
- (BOOL) reliableResponses {
  return !!reliableResponses_;
}
- (void) setReliableResponses:(BOOL) value {
  reliableResponses_ = !!value;
}
- (BOOL) hasPayload {
  return !!hasPayload_;
}
- (void) setHasPayload:(BOOL) value {
  hasPayload_ = !!value;
}
@synthesize payload;
- (void) dealloc {
  self.requestId = nil;
  self.payload = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.requestId = @"";
    self.reliableRequest = NO;
    self.reliableResponses = NO;
    self.payload = [NSData data];
  }
  return self;
}
static SingleRequestMultipleResponseRequest* defaultSingleRequestMultipleResponseRequestInstance = nil;
+ (void) initialize {
  if (self == [SingleRequestMultipleResponseRequest class]) {
    defaultSingleRequestMultipleResponseRequestInstance = [[SingleRequestMultipleResponseRequest alloc] init];
  }
}
+ (SingleRequestMultipleResponseRequest*) defaultInstance {
  return defaultSingleRequestMultipleResponseRequestInstance;
}
- (SingleRequestMultipleResponseRequest*) defaultInstance {
  return defaultSingleRequestMultipleResponseRequestInstance;
}
- (BOOL) isInitialized {
  if (!self.hasRequestId) {
    return NO;
  }
  if (!self.hasReliableRequest) {
    return NO;
  }
  if (!self.hasReliableResponses) {
    return NO;
  }
  if (!self.hasPayload) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasRequestId) {
    [output writeString:1 value:self.requestId];
  }
  if (self.hasReliableRequest) {
    [output writeBool:2 value:self.reliableRequest];
  }
  if (self.hasReliableResponses) {
    [output writeBool:3 value:self.reliableResponses];
  }
  if (self.hasPayload) {
    [output writeData:4 value:self.payload];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasRequestId) {
    size += computeStringSize(1, self.requestId);
  }
  if (self.hasReliableRequest) {
    size += computeBoolSize(2, self.reliableRequest);
  }
  if (self.hasReliableResponses) {
    size += computeBoolSize(3, self.reliableResponses);
  }
  if (self.hasPayload) {
    size += computeDataSize(4, self.payload);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (SingleRequestMultipleResponseRequest*) parseFromData:(NSData*) data {
  return (SingleRequestMultipleResponseRequest*)[[[SingleRequestMultipleResponseRequest builder] mergeFromData:data] build];
}
+ (SingleRequestMultipleResponseRequest*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SingleRequestMultipleResponseRequest*)[[[SingleRequestMultipleResponseRequest builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (SingleRequestMultipleResponseRequest*) parseFromInputStream:(NSInputStream*) input {
  return (SingleRequestMultipleResponseRequest*)[[[SingleRequestMultipleResponseRequest builder] mergeFromInputStream:input] build];
}
+ (SingleRequestMultipleResponseRequest*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SingleRequestMultipleResponseRequest*)[[[SingleRequestMultipleResponseRequest builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (SingleRequestMultipleResponseRequest*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (SingleRequestMultipleResponseRequest*)[[[SingleRequestMultipleResponseRequest builder] mergeFromCodedInputStream:input] build];
}
+ (SingleRequestMultipleResponseRequest*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SingleRequestMultipleResponseRequest*)[[[SingleRequestMultipleResponseRequest builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (SingleRequestMultipleResponseRequest_Builder*) builder {
  return [[[SingleRequestMultipleResponseRequest_Builder alloc] init] autorelease];
}
+ (SingleRequestMultipleResponseRequest_Builder*) builderWithPrototype:(SingleRequestMultipleResponseRequest*) prototype {
  return [[SingleRequestMultipleResponseRequest builder] mergeFrom:prototype];
}
- (SingleRequestMultipleResponseRequest_Builder*) builder {
  return [SingleRequestMultipleResponseRequest builder];
}
@end

@interface SingleRequestMultipleResponseRequest_Builder()
@property (retain) SingleRequestMultipleResponseRequest* result;
@end

@implementation SingleRequestMultipleResponseRequest_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[SingleRequestMultipleResponseRequest alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (SingleRequestMultipleResponseRequest_Builder*) clear {
  self.result = [[[SingleRequestMultipleResponseRequest alloc] init] autorelease];
  return self;
}
- (SingleRequestMultipleResponseRequest_Builder*) clone {
  return [SingleRequestMultipleResponseRequest builderWithPrototype:result];
}
- (SingleRequestMultipleResponseRequest*) defaultInstance {
  return [SingleRequestMultipleResponseRequest defaultInstance];
}
- (SingleRequestMultipleResponseRequest*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (SingleRequestMultipleResponseRequest*) buildPartial {
  SingleRequestMultipleResponseRequest* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (SingleRequestMultipleResponseRequest_Builder*) mergeFrom:(SingleRequestMultipleResponseRequest*) other {
  if (other == [SingleRequestMultipleResponseRequest defaultInstance]) {
    return self;
  }
  if (other.hasRequestId) {
    [self setRequestId:other.requestId];
  }
  if (other.hasReliableRequest) {
    [self setReliableRequest:other.reliableRequest];
  }
  if (other.hasReliableResponses) {
    [self setReliableResponses:other.reliableResponses];
  }
  if (other.hasPayload) {
    [self setPayload:other.payload];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (SingleRequestMultipleResponseRequest_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (SingleRequestMultipleResponseRequest_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setRequestId:[input readString]];
        break;
      }
      case 16: {
        [self setReliableRequest:[input readBool]];
        break;
      }
      case 24: {
        [self setReliableResponses:[input readBool]];
        break;
      }
      case 34: {
        [self setPayload:[input readData]];
        break;
      }
    }
  }
}
- (BOOL) hasRequestId {
  return result.hasRequestId;
}
- (NSString*) requestId {
  return result.requestId;
}
- (SingleRequestMultipleResponseRequest_Builder*) setRequestId:(NSString*) value {
  result.hasRequestId = YES;
  result.requestId = value;
  return self;
}
- (SingleRequestMultipleResponseRequest_Builder*) clearRequestId {
  result.hasRequestId = NO;
  result.requestId = @"";
  return self;
}
- (BOOL) hasReliableRequest {
  return result.hasReliableRequest;
}
- (BOOL) reliableRequest {
  return result.reliableRequest;
}
- (SingleRequestMultipleResponseRequest_Builder*) setReliableRequest:(BOOL) value {
  result.hasReliableRequest = YES;
  result.reliableRequest = value;
  return self;
}
- (SingleRequestMultipleResponseRequest_Builder*) clearReliableRequest {
  result.hasReliableRequest = NO;
  result.reliableRequest = NO;
  return self;
}
- (BOOL) hasReliableResponses {
  return result.hasReliableResponses;
}
- (BOOL) reliableResponses {
  return result.reliableResponses;
}
- (SingleRequestMultipleResponseRequest_Builder*) setReliableResponses:(BOOL) value {
  result.hasReliableResponses = YES;
  result.reliableResponses = value;
  return self;
}
- (SingleRequestMultipleResponseRequest_Builder*) clearReliableResponses {
  result.hasReliableResponses = NO;
  result.reliableResponses = NO;
  return self;
}
- (BOOL) hasPayload {
  return result.hasPayload;
}
- (NSData*) payload {
  return result.payload;
}
- (SingleRequestMultipleResponseRequest_Builder*) setPayload:(NSData*) value {
  result.hasPayload = YES;
  result.payload = value;
  return self;
}
- (SingleRequestMultipleResponseRequest_Builder*) clearPayload {
  result.hasPayload = NO;
  result.payload = [NSData data];
  return self;
}
@end

@interface SingleRequestMultipleResponseResponse ()
@property (retain) NSString* requestId;
@property (retain) NSData* payload;
@end

@implementation SingleRequestMultipleResponseResponse

- (BOOL) hasRequestId {
  return !!hasRequestId_;
}
- (void) setHasRequestId:(BOOL) value {
  hasRequestId_ = !!value;
}
@synthesize requestId;
- (BOOL) hasPayload {
  return !!hasPayload_;
}
- (void) setHasPayload:(BOOL) value {
  hasPayload_ = !!value;
}
@synthesize payload;
- (void) dealloc {
  self.requestId = nil;
  self.payload = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.requestId = @"";
    self.payload = [NSData data];
  }
  return self;
}
static SingleRequestMultipleResponseResponse* defaultSingleRequestMultipleResponseResponseInstance = nil;
+ (void) initialize {
  if (self == [SingleRequestMultipleResponseResponse class]) {
    defaultSingleRequestMultipleResponseResponseInstance = [[SingleRequestMultipleResponseResponse alloc] init];
  }
}
+ (SingleRequestMultipleResponseResponse*) defaultInstance {
  return defaultSingleRequestMultipleResponseResponseInstance;
}
- (SingleRequestMultipleResponseResponse*) defaultInstance {
  return defaultSingleRequestMultipleResponseResponseInstance;
}
- (BOOL) isInitialized {
  if (!self.hasRequestId) {
    return NO;
  }
  if (!self.hasPayload) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasRequestId) {
    [output writeString:1 value:self.requestId];
  }
  if (self.hasPayload) {
    [output writeData:2 value:self.payload];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasRequestId) {
    size += computeStringSize(1, self.requestId);
  }
  if (self.hasPayload) {
    size += computeDataSize(2, self.payload);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (SingleRequestMultipleResponseResponse*) parseFromData:(NSData*) data {
  return (SingleRequestMultipleResponseResponse*)[[[SingleRequestMultipleResponseResponse builder] mergeFromData:data] build];
}
+ (SingleRequestMultipleResponseResponse*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SingleRequestMultipleResponseResponse*)[[[SingleRequestMultipleResponseResponse builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (SingleRequestMultipleResponseResponse*) parseFromInputStream:(NSInputStream*) input {
  return (SingleRequestMultipleResponseResponse*)[[[SingleRequestMultipleResponseResponse builder] mergeFromInputStream:input] build];
}
+ (SingleRequestMultipleResponseResponse*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SingleRequestMultipleResponseResponse*)[[[SingleRequestMultipleResponseResponse builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (SingleRequestMultipleResponseResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (SingleRequestMultipleResponseResponse*)[[[SingleRequestMultipleResponseResponse builder] mergeFromCodedInputStream:input] build];
}
+ (SingleRequestMultipleResponseResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SingleRequestMultipleResponseResponse*)[[[SingleRequestMultipleResponseResponse builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (SingleRequestMultipleResponseResponse_Builder*) builder {
  return [[[SingleRequestMultipleResponseResponse_Builder alloc] init] autorelease];
}
+ (SingleRequestMultipleResponseResponse_Builder*) builderWithPrototype:(SingleRequestMultipleResponseResponse*) prototype {
  return [[SingleRequestMultipleResponseResponse builder] mergeFrom:prototype];
}
- (SingleRequestMultipleResponseResponse_Builder*) builder {
  return [SingleRequestMultipleResponseResponse builder];
}
@end

@interface SingleRequestMultipleResponseResponse_Builder()
@property (retain) SingleRequestMultipleResponseResponse* result;
@end

@implementation SingleRequestMultipleResponseResponse_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[SingleRequestMultipleResponseResponse alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (SingleRequestMultipleResponseResponse_Builder*) clear {
  self.result = [[[SingleRequestMultipleResponseResponse alloc] init] autorelease];
  return self;
}
- (SingleRequestMultipleResponseResponse_Builder*) clone {
  return [SingleRequestMultipleResponseResponse builderWithPrototype:result];
}
- (SingleRequestMultipleResponseResponse*) defaultInstance {
  return [SingleRequestMultipleResponseResponse defaultInstance];
}
- (SingleRequestMultipleResponseResponse*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (SingleRequestMultipleResponseResponse*) buildPartial {
  SingleRequestMultipleResponseResponse* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (SingleRequestMultipleResponseResponse_Builder*) mergeFrom:(SingleRequestMultipleResponseResponse*) other {
  if (other == [SingleRequestMultipleResponseResponse defaultInstance]) {
    return self;
  }
  if (other.hasRequestId) {
    [self setRequestId:other.requestId];
  }
  if (other.hasPayload) {
    [self setPayload:other.payload];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (SingleRequestMultipleResponseResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (SingleRequestMultipleResponseResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setRequestId:[input readString]];
        break;
      }
      case 18: {
        [self setPayload:[input readData]];
        break;
      }
    }
  }
}
- (BOOL) hasRequestId {
  return result.hasRequestId;
}
- (NSString*) requestId {
  return result.requestId;
}
- (SingleRequestMultipleResponseResponse_Builder*) setRequestId:(NSString*) value {
  result.hasRequestId = YES;
  result.requestId = value;
  return self;
}
- (SingleRequestMultipleResponseResponse_Builder*) clearRequestId {
  result.hasRequestId = NO;
  result.requestId = @"";
  return self;
}
- (BOOL) hasPayload {
  return result.hasPayload;
}
- (NSData*) payload {
  return result.payload;
}
- (SingleRequestMultipleResponseResponse_Builder*) setPayload:(NSData*) value {
  result.hasPayload = YES;
  result.payload = value;
  return self;
}
- (SingleRequestMultipleResponseResponse_Builder*) clearPayload {
  result.hasPayload = NO;
  result.payload = [NSData data];
  return self;
}
@end

