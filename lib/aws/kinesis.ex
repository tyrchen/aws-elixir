# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/jkakar/aws-codegen for more details.

defmodule AWS.Kinesis do
  @moduledoc """
  Amazon Kinesis Data Streams Service API Reference

  Amazon Kinesis Data Streams is a managed service that scales elastically
  for real-time processing of streaming big data.
  """

  @doc """
  Adds or updates tags for the specified Kinesis data stream. Each time you
  invoke this operation, you can specify up to 10 tags. If you want to add
  more than 10 tags to your stream, you can invoke this operation multiple
  times. In total, each stream can have up to 50 tags.

  If tags have already been assigned to the stream, `AddTagsToStream`
  overwrites any existing tags that correspond to the specified tag keys.

  `AddTagsToStream` has a limit of five transactions per second per account.
  """
  def add_tags_to_stream(client, input, options \\ []) do
    request(client, "AddTagsToStream", input, options)
  end

  @doc """
  Creates a Kinesis data stream. A stream captures and transports data
  records that are continuously emitted from different data sources or
  *producers*. Scale-out within a stream is explicitly supported by means of
  shards, which are uniquely identified groups of data records in a stream.

  You specify and control the number of shards that a stream is composed of.
  Each shard can support reads up to five transactions per second, up to a
  maximum data read total of 2 MB per second. Each shard can support writes
  up to 1,000 records per second, up to a maximum data write total of 1 MB
  per second. If the amount of data input increases or decreases, you can add
  or remove shards.

  The stream name identifies the stream. The name is scoped to the AWS
  account used by the application. It is also scoped by AWS Region. That is,
  two streams in two different accounts can have the same name, and two
  streams in the same account, but in two different Regions, can have the
  same name.

  `CreateStream` is an asynchronous operation. Upon receiving a
  `CreateStream` request, Kinesis Data Streams immediately returns and sets
  the stream status to `CREATING`. After the stream is created, Kinesis Data
  Streams sets the stream status to `ACTIVE`. You should perform read and
  write operations only on an `ACTIVE` stream.

  You receive a `LimitExceededException` when making a `CreateStream` request
  when you try to do one of the following:

  <ul> <li> Have more than five streams in the `CREATING` state at any point
  in time.

  </li> <li> Create more shards than are authorized for your account.

  </li> </ul> For the default shard limit for an AWS account, see [Amazon
  Kinesis Data Streams
  Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  in the *Amazon Kinesis Data Streams Developer Guide*. To increase this
  limit, [contact AWS
  Support](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html).

  You can use `DescribeStream` to check the stream status, which is returned
  in `StreamStatus`.

  `CreateStream` has a limit of five transactions per second per account.
  """
  def create_stream(client, input, options \\ []) do
    request(client, "CreateStream", input, options)
  end

  @doc """
  Decreases the Kinesis data stream's retention period, which is the length
  of time data records are accessible after they are added to the stream. The
  minimum value of a stream's retention period is 24 hours.

  This operation may result in lost data. For example, if the stream's
  retention period is 48 hours and is decreased to 24 hours, any data already
  in the stream that is older than 24 hours is inaccessible.
  """
  def decrease_stream_retention_period(client, input, options \\ []) do
    request(client, "DecreaseStreamRetentionPeriod", input, options)
  end

  @doc """
  Deletes a Kinesis data stream and all its shards and data. You must shut
  down any applications that are operating on the stream before you delete
  the stream. If an application attempts to operate on a deleted stream, it
  receives the exception `ResourceNotFoundException`.

  If the stream is in the `ACTIVE` state, you can delete it. After a
  `DeleteStream` request, the specified stream is in the `DELETING` state
  until Kinesis Data Streams completes the deletion.

  **Note:** Kinesis Data Streams might continue to accept data read and write
  operations, such as `PutRecord`, `PutRecords`, and `GetRecords`, on a
  stream in the `DELETING` state until the stream deletion is complete.

  When you delete a stream, any shards in that stream are also deleted, and
  any tags are dissociated from the stream.

  You can use the `DescribeStream` operation to check the state of the
  stream, which is returned in `StreamStatus`.

  `DeleteStream` has a limit of five transactions per second per account.
  """
  def delete_stream(client, input, options \\ []) do
    request(client, "DeleteStream", input, options)
  end

  @doc """
  To deregister a consumer, provide its ARN. Alternatively, you can provide
  the ARN of the data stream and the name you gave the consumer when you
  registered it. You may also provide all three parameters, as long as they
  don't conflict with each other. If you don't know the name or ARN of the
  consumer that you want to deregister, you can use the `ListStreamConsumers`
  operation to get a list of the descriptions of all the consumers that are
  currently registered with a given data stream. The description of a
  consumer contains its name and ARN.

  This operation has a limit of five transactions per second per account.
  """
  def deregister_stream_consumer(client, input, options \\ []) do
    request(client, "DeregisterStreamConsumer", input, options)
  end

  @doc """
  Describes the shard limits and usage for the account.

  If you update your account limits, the old limits might be returned for a
  few minutes.

  This operation has a limit of one transaction per second per account.
  """
  def describe_limits(client, input, options \\ []) do
    request(client, "DescribeLimits", input, options)
  end

  @doc """
  Describes the specified Kinesis data stream.

  The information returned includes the stream name, Amazon Resource Name
  (ARN), creation time, enhanced metric configuration, and shard map. The
  shard map is an array of shard objects. For each shard object, there is the
  hash key and sequence number ranges that the shard spans, and the IDs of
  any earlier shards that played in a role in creating the shard. Every
  record ingested in the stream is identified by a sequence number, which is
  assigned when the record is put into the stream.

  You can limit the number of shards returned by each call. For more
  information, see [Retrieving Shards from a
  Stream](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-retrieve-shards.html)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  There are no guarantees about the chronological order shards returned. To
  process shards in chronological order, use the ID of the parent shard to
  track the lineage to the oldest shard.

  This operation has a limit of 10 transactions per second per account.
  """
  def describe_stream(client, input, options \\ []) do
    request(client, "DescribeStream", input, options)
  end

  @doc """
  To get the description of a registered consumer, provide the ARN of the
  consumer. Alternatively, you can provide the ARN of the data stream and the
  name you gave the consumer when you registered it. You may also provide all
  three parameters, as long as they don't conflict with each other. If you
  don't know the name or ARN of the consumer that you want to describe, you
  can use the `ListStreamConsumers` operation to get a list of the
  descriptions of all the consumers that are currently registered with a
  given data stream.

  This operation has a limit of 20 transactions per second per account.
  """
  def describe_stream_consumer(client, input, options \\ []) do
    request(client, "DescribeStreamConsumer", input, options)
  end

  @doc """
  Provides a summarized description of the specified Kinesis data stream
  without the shard list.

  The information returned includes the stream name, Amazon Resource Name
  (ARN), status, record retention period, approximate creation time,
  monitoring, encryption details, and open shard count.
  """
  def describe_stream_summary(client, input, options \\ []) do
    request(client, "DescribeStreamSummary", input, options)
  end

  @doc """
  Disables enhanced monitoring.
  """
  def disable_enhanced_monitoring(client, input, options \\ []) do
    request(client, "DisableEnhancedMonitoring", input, options)
  end

  @doc """
  Enables enhanced Kinesis data stream monitoring for shard-level metrics.
  """
  def enable_enhanced_monitoring(client, input, options \\ []) do
    request(client, "EnableEnhancedMonitoring", input, options)
  end

  @doc """
  Gets data records from a Kinesis data stream's shard.

  Specify a shard iterator using the `ShardIterator` parameter. The shard
  iterator specifies the position in the shard from which you want to start
  reading data records sequentially. If there are no records available in the
  portion of the shard that the iterator points to, `GetRecords` returns an
  empty list. It might take multiple calls to get to a portion of the shard
  that contains records.

  You can scale by provisioning multiple shards per stream while considering
  service limits (for more information, see [Amazon Kinesis Data Streams
  Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  in the *Amazon Kinesis Data Streams Developer Guide*). Your application
  should have one thread per shard, each reading continuously from its
  stream. To read from a stream continually, call `GetRecords` in a loop. Use
  `GetShardIterator` to get the shard iterator to specify in the first
  `GetRecords` call. `GetRecords` returns a new shard iterator in
  `NextShardIterator`. Specify the shard iterator returned in
  `NextShardIterator` in subsequent calls to `GetRecords`. If the shard has
  been closed, the shard iterator can't return more data and `GetRecords`
  returns `null` in `NextShardIterator`. You can terminate the loop when the
  shard is closed, or when the shard iterator reaches the record with the
  sequence number or other attribute that marks it as the last record to
  process.

  Each data record can be up to 1 MiB in size, and each shard can read up to
  2 MiB per second. You can ensure that your calls don't exceed the maximum
  supported size or throughput by using the `Limit` parameter to specify the
  maximum number of records that `GetRecords` can return. Consider your
  average record size when determining this limit. The maximum number of
  records that can be returned per call is 10,000.

  The size of the data returned by `GetRecords` varies depending on the
  utilization of the shard. The maximum size of data that `GetRecords` can
  return is 10 MiB. If a call returns this amount of data, subsequent calls
  made within the next 5 seconds throw
  `ProvisionedThroughputExceededException`. If there is insufficient
  provisioned throughput on the stream, subsequent calls made within the next
  1 second throw `ProvisionedThroughputExceededException`. `GetRecords`
  doesn't return any data when it throws an exception. For this reason, we
  recommend that you wait 1 second between calls to `GetRecords`. However,
  it's possible that the application will get exceptions for longer than 1
  second.

  To detect whether the application is falling behind in processing, you can
  use the `MillisBehindLatest` response attribute. You can also monitor the
  stream using CloudWatch metrics and other mechanisms (see
  [Monitoring](http://docs.aws.amazon.com/kinesis/latest/dev/monitoring.html)
  in the *Amazon Kinesis Data Streams Developer Guide*).

  Each Amazon Kinesis record includes a value, `ApproximateArrivalTimestamp`,
  that is set when a stream successfully receives and stores a record. This
  is commonly referred to as a server-side time stamp, whereas a client-side
  time stamp is set when a data producer creates or sends the record to a
  stream (a data producer is any data source putting data records into a
  stream, for example with `PutRecords`). The time stamp has millisecond
  precision. There are no guarantees about the time stamp accuracy, or that
  the time stamp is always increasing. For example, records in a shard or
  across a stream might have time stamps that are out of order.

  This operation has a limit of five transactions per second per account.
  """
  def get_records(client, input, options \\ []) do
    request(client, "GetRecords", input, options)
  end

  @doc """
  Gets an Amazon Kinesis shard iterator. A shard iterator expires 5 minutes
  after it is returned to the requester.

  A shard iterator specifies the shard position from which to start reading
  data records sequentially. The position is specified using the sequence
  number of a data record in a shard. A sequence number is the identifier
  associated with every record ingested in the stream, and is assigned when a
  record is put into the stream. Each stream has one or more shards.

  You must specify the shard iterator type. For example, you can set the
  `ShardIteratorType` parameter to read exactly from the position denoted by
  a specific sequence number by using the `AT_SEQUENCE_NUMBER` shard iterator
  type. Alternatively, the parameter can read right after the sequence number
  by using the `AFTER_SEQUENCE_NUMBER` shard iterator type, using sequence
  numbers returned by earlier calls to `PutRecord`, `PutRecords`,
  `GetRecords`, or `DescribeStream`. In the request, you can specify the
  shard iterator type `AT_TIMESTAMP` to read records from an arbitrary point
  in time, `TRIM_HORIZON` to cause `ShardIterator` to point to the last
  untrimmed record in the shard in the system (the oldest data record in the
  shard), or `LATEST` so that you always read the most recent data in the
  shard.

  When you read repeatedly from a stream, use a `GetShardIterator` request to
  get the first shard iterator for use in your first `GetRecords` request and
  for subsequent reads use the shard iterator returned by the `GetRecords`
  request in `NextShardIterator`. A new shard iterator is returned by every
  `GetRecords` request in `NextShardIterator`, which you use in the
  `ShardIterator` parameter of the next `GetRecords` request.

  If a `GetShardIterator` request is made too often, you receive a
  `ProvisionedThroughputExceededException`. For more information about
  throughput limits, see `GetRecords`, and [Streams
  Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  If the shard is closed, `GetShardIterator` returns a valid iterator for the
  last sequence number of the shard. A shard can be closed as a result of
  using `SplitShard` or `MergeShards`.

  `GetShardIterator` has a limit of five transactions per second per account
  per open shard.
  """
  def get_shard_iterator(client, input, options \\ []) do
    request(client, "GetShardIterator", input, options)
  end

  @doc """
  Increases the Kinesis data stream's retention period, which is the length
  of time data records are accessible after they are added to the stream. The
  maximum value of a stream's retention period is 168 hours (7 days).

  If you choose a longer stream retention period, this operation increases
  the time period during which records that have not yet expired are
  accessible. However, it does not make previous, expired data (older than
  the stream's previous retention period) accessible after the operation has
  been called. For example, if a stream's retention period is set to 24 hours
  and is increased to 168 hours, any data that is older than 24 hours remains
  inaccessible to consumer applications.
  """
  def increase_stream_retention_period(client, input, options \\ []) do
    request(client, "IncreaseStreamRetentionPeriod", input, options)
  end

  @doc """
  Lists the shards in a stream and provides information about each shard.
  This operation has a limit of 100 transactions per second per data stream.

  <important> This API is a new operation that is used by the Amazon Kinesis
  Client Library (KCL). If you have a fine-grained IAM policy that only
  allows specific operations, you must update your policy to allow calls to
  this API. For more information, see [Controlling Access to Amazon Kinesis
  Data Streams Resources Using
  IAM](https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html).

  </important>
  """
  def list_shards(client, input, options \\ []) do
    request(client, "ListShards", input, options)
  end

  @doc """
  Lists the consumers registered to receive data from a stream using enhanced
  fan-out, and provides information about each consumer.

  This operation has a limit of 10 transactions per second per account.
  """
  def list_stream_consumers(client, input, options \\ []) do
    request(client, "ListStreamConsumers", input, options)
  end

  @doc """
  Lists your Kinesis data streams.

  The number of streams may be too large to return from a single call to
  `ListStreams`. You can limit the number of returned streams using the
  `Limit` parameter. If you do not specify a value for the `Limit` parameter,
  Kinesis Data Streams uses the default limit, which is currently 10.

  You can detect if there are more streams available to list by using the
  `HasMoreStreams` flag from the returned output. If there are more streams
  available, you can request more streams by using the name of the last
  stream returned by the `ListStreams` request in the
  `ExclusiveStartStreamName` parameter in a subsequent request to
  `ListStreams`. The group of stream names returned by the subsequent request
  is then added to the list. You can continue this process until all the
  stream names have been collected in the list.

  `ListStreams` has a limit of five transactions per second per account.
  """
  def list_streams(client, input, options \\ []) do
    request(client, "ListStreams", input, options)
  end

  @doc """
  Lists the tags for the specified Kinesis data stream. This operation has a
  limit of five transactions per second per account.
  """
  def list_tags_for_stream(client, input, options \\ []) do
    request(client, "ListTagsForStream", input, options)
  end

  @doc """
  Merges two adjacent shards in a Kinesis data stream and combines them into
  a single shard to reduce the stream's capacity to ingest and transport
  data. Two shards are considered adjacent if the union of the hash key
  ranges for the two shards form a contiguous set with no gaps. For example,
  if you have two shards, one with a hash key range of 276...381 and the
  other with a hash key range of 382...454, then you could merge these two
  shards into a single shard that would have a hash key range of 276...454.
  After the merge, the single child shard receives data for all hash key
  values covered by the two parent shards.

  `MergeShards` is called when there is a need to reduce the overall capacity
  of a stream because of excess capacity that is not being used. You must
  specify the shard to be merged and the adjacent shard for a stream. For
  more information about merging shards, see [Merge Two
  Shards](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-merge.html)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  If the stream is in the `ACTIVE` state, you can call `MergeShards`. If a
  stream is in the `CREATING`, `UPDATING`, or `DELETING` state, `MergeShards`
  returns a `ResourceInUseException`. If the specified stream does not exist,
  `MergeShards` returns a `ResourceNotFoundException`.

  You can use `DescribeStream` to check the state of the stream, which is
  returned in `StreamStatus`.

  `MergeShards` is an asynchronous operation. Upon receiving a `MergeShards`
  request, Amazon Kinesis Data Streams immediately returns a response and
  sets the `StreamStatus` to `UPDATING`. After the operation is completed,
  Kinesis Data Streams sets the `StreamStatus` to `ACTIVE`. Read and write
  operations continue to work while the stream is in the `UPDATING` state.

  You use `DescribeStream` to determine the shard IDs that are specified in
  the `MergeShards` request.

  If you try to operate on too many streams in parallel using `CreateStream`,
  `DeleteStream`, `MergeShards`, or `SplitShard`, you receive a
  `LimitExceededException`.

  `MergeShards` has a limit of five transactions per second per account.
  """
  def merge_shards(client, input, options \\ []) do
    request(client, "MergeShards", input, options)
  end

  @doc """
  Writes a single data record into an Amazon Kinesis data stream. Call
  `PutRecord` to send data into the stream for real-time ingestion and
  subsequent processing, one record at a time. Each shard can support writes
  up to 1,000 records per second, up to a maximum data write total of 1 MB
  per second.

  You must specify the name of the stream that captures, stores, and
  transports the data; a partition key; and the data blob itself.

  The data blob can be any type of data; for example, a segment from a log
  file, geographic/location data, website clickstream data, and so on.

  The partition key is used by Kinesis Data Streams to distribute data across
  shards. Kinesis Data Streams segregates the data records that belong to a
  stream into multiple shards, using the partition key associated with each
  data record to determine the shard to which a given data record belongs.

  Partition keys are Unicode strings, with a maximum length limit of 256
  characters for each key. An MD5 hash function is used to map partition keys
  to 128-bit integer values and to map associated data records to shards
  using the hash key ranges of the shards. You can override hashing the
  partition key to determine the shard by explicitly specifying a hash value
  using the `ExplicitHashKey` parameter. For more information, see [Adding
  Data to a
  Stream](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  `PutRecord` returns the shard ID of where the data record was placed and
  the sequence number that was assigned to the data record.

  Sequence numbers increase over time and are specific to a shard within a
  stream, not across all shards within a stream. To guarantee strictly
  increasing ordering, write serially to a shard and use the
  `SequenceNumberForOrdering` parameter. For more information, see [Adding
  Data to a
  Stream](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  If a `PutRecord` request cannot be processed because of insufficient
  provisioned throughput on the shard involved in the request, `PutRecord`
  throws `ProvisionedThroughputExceededException`.

  By default, data records are accessible for 24 hours from the time that
  they are added to a stream. You can use `IncreaseStreamRetentionPeriod` or
  `DecreaseStreamRetentionPeriod` to modify this retention period.
  """
  def put_record(client, input, options \\ []) do
    request(client, "PutRecord", input, options)
  end

  @doc """
  Writes multiple data records into a Kinesis data stream in a single call
  (also referred to as a `PutRecords` request). Use this operation to send
  data into the stream for data ingestion and processing.

  Each `PutRecords` request can support up to 500 records. Each record in the
  request can be as large as 1 MB, up to a limit of 5 MB for the entire
  request, including partition keys. Each shard can support writes up to
  1,000 records per second, up to a maximum data write total of 1 MB per
  second.

  You must specify the name of the stream that captures, stores, and
  transports the data; and an array of request `Records`, with each record in
  the array requiring a partition key and data blob. The record size limit
  applies to the total size of the partition key and data blob.

  The data blob can be any type of data; for example, a segment from a log
  file, geographic/location data, website clickstream data, and so on.

  The partition key is used by Kinesis Data Streams as input to a hash
  function that maps the partition key and associated data to a specific
  shard. An MD5 hash function is used to map partition keys to 128-bit
  integer values and to map associated data records to shards. As a result of
  this hashing mechanism, all data records with the same partition key map to
  the same shard within the stream. For more information, see [Adding Data to
  a
  Stream](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  Each record in the `Records` array may include an optional parameter,
  `ExplicitHashKey`, which overrides the partition key to shard mapping. This
  parameter allows a data producer to determine explicitly the shard where
  the record is stored. For more information, see [Adding Multiple Records
  with
  PutRecords](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-putrecords)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  The `PutRecords` response includes an array of response `Records`. Each
  record in the response array directly correlates with a record in the
  request array using natural ordering, from the top to the bottom of the
  request and response. The response `Records` array always includes the same
  number of records as the request array.

  The response `Records` array includes both successfully and unsuccessfully
  processed records. Kinesis Data Streams attempts to process all records in
  each `PutRecords` request. A single record failure does not stop the
  processing of subsequent records.

  A successfully processed record includes `ShardId` and `SequenceNumber`
  values. The `ShardId` parameter identifies the shard in the stream where
  the record is stored. The `SequenceNumber` parameter is an identifier
  assigned to the put record, unique to all records in the stream.

  An unsuccessfully processed record includes `ErrorCode` and `ErrorMessage`
  values. `ErrorCode` reflects the type of error and can be one of the
  following values: `ProvisionedThroughputExceededException` or
  `InternalFailure`. `ErrorMessage` provides more detailed information about
  the `ProvisionedThroughputExceededException` exception including the
  account ID, stream name, and shard ID of the record that was throttled. For
  more information about partially successful responses, see [Adding Multiple
  Records with
  PutRecords](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-add-data-to-stream.html#kinesis-using-sdk-java-putrecords)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  By default, data records are accessible for 24 hours from the time that
  they are added to a stream. You can use `IncreaseStreamRetentionPeriod` or
  `DecreaseStreamRetentionPeriod` to modify this retention period.
  """
  def put_records(client, input, options \\ []) do
    request(client, "PutRecords", input, options)
  end

  @doc """
  Registers a consumer with a Kinesis data stream. When you use this
  operation, the consumer you register can read data from the stream at a
  rate of up to 2 MiB per second. This rate is unaffected by the total number
  of consumers that read from the same stream.

  You can register up to 5 consumers per stream. A given consumer can only be
  registered with one stream.

  This operation has a limit of five transactions per second per account.
  """
  def register_stream_consumer(client, input, options \\ []) do
    request(client, "RegisterStreamConsumer", input, options)
  end

  @doc """
  Removes tags from the specified Kinesis data stream. Removed tags are
  deleted and cannot be recovered after this operation successfully
  completes.

  If you specify a tag that does not exist, it is ignored.

  `RemoveTagsFromStream` has a limit of five transactions per second per
  account.
  """
  def remove_tags_from_stream(client, input, options \\ []) do
    request(client, "RemoveTagsFromStream", input, options)
  end

  @doc """
  Splits a shard into two new shards in the Kinesis data stream, to increase
  the stream's capacity to ingest and transport data. `SplitShard` is called
  when there is a need to increase the overall capacity of a stream because
  of an expected increase in the volume of data records being ingested.

  You can also use `SplitShard` when a shard appears to be approaching its
  maximum utilization; for example, the producers sending data into the
  specific shard are suddenly sending more than previously anticipated. You
  can also call `SplitShard` to increase stream capacity, so that more
  Kinesis Data Streams applications can simultaneously read data from the
  stream for real-time processing.

  You must specify the shard to be split and the new hash key, which is the
  position in the shard where the shard gets split in two. In many cases, the
  new hash key might be the average of the beginning and ending hash key, but
  it can be any hash key value in the range being mapped into the shard. For
  more information, see [Split a
  Shard](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-split.html)
  in the *Amazon Kinesis Data Streams Developer Guide*.

  You can use `DescribeStream` to determine the shard ID and hash key values
  for the `ShardToSplit` and `NewStartingHashKey` parameters that are
  specified in the `SplitShard` request.

  `SplitShard` is an asynchronous operation. Upon receiving a `SplitShard`
  request, Kinesis Data Streams immediately returns a response and sets the
  stream status to `UPDATING`. After the operation is completed, Kinesis Data
  Streams sets the stream status to `ACTIVE`. Read and write operations
  continue to work while the stream is in the `UPDATING` state.

  You can use `DescribeStream` to check the status of the stream, which is
  returned in `StreamStatus`. If the stream is in the `ACTIVE` state, you can
  call `SplitShard`. If a stream is in `CREATING` or `UPDATING` or `DELETING`
  states, `DescribeStream` returns a `ResourceInUseException`.

  If the specified stream does not exist, `DescribeStream` returns a
  `ResourceNotFoundException`. If you try to create more shards than are
  authorized for your account, you receive a `LimitExceededException`.

  For the default shard limit for an AWS account, see [Kinesis Data Streams
  Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  in the *Amazon Kinesis Data Streams Developer Guide*. To increase this
  limit, [contact AWS
  Support](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html).

  If you try to operate on too many streams simultaneously using
  `CreateStream`, `DeleteStream`, `MergeShards`, and/or `SplitShard`, you
  receive a `LimitExceededException`.

  `SplitShard` has a limit of five transactions per second per account.
  """
  def split_shard(client, input, options \\ []) do
    request(client, "SplitShard", input, options)
  end

  @doc """
  Enables or updates server-side encryption using an AWS KMS key for a
  specified stream.

  Starting encryption is an asynchronous operation. Upon receiving the
  request, Kinesis Data Streams returns immediately and sets the status of
  the stream to `UPDATING`. After the update is complete, Kinesis Data
  Streams sets the status of the stream back to `ACTIVE`. Updating or
  applying encryption normally takes a few seconds to complete, but it can
  take minutes. You can continue to read and write data to your stream while
  its status is `UPDATING`. Once the status of the stream is `ACTIVE`,
  encryption begins for records written to the stream.

  API Limits: You can successfully apply a new AWS KMS key for server-side
  encryption 25 times in a rolling 24-hour period.

  Note: It can take up to 5 seconds after the stream is in an `ACTIVE` status
  before all records written to the stream are encrypted. After you enable
  encryption, you can verify that encryption is applied by inspecting the API
  response from `PutRecord` or `PutRecords`.
  """
  def start_stream_encryption(client, input, options \\ []) do
    request(client, "StartStreamEncryption", input, options)
  end

  @doc """
  Disables server-side encryption for a specified stream.

  Stopping encryption is an asynchronous operation. Upon receiving the
  request, Kinesis Data Streams returns immediately and sets the status of
  the stream to `UPDATING`. After the update is complete, Kinesis Data
  Streams sets the status of the stream back to `ACTIVE`. Stopping encryption
  normally takes a few seconds to complete, but it can take minutes. You can
  continue to read and write data to your stream while its status is
  `UPDATING`. Once the status of the stream is `ACTIVE`, records written to
  the stream are no longer encrypted by Kinesis Data Streams.

  API Limits: You can successfully disable server-side encryption 25 times in
  a rolling 24-hour period.

  Note: It can take up to 5 seconds after the stream is in an `ACTIVE` status
  before all records written to the stream are no longer subject to
  encryption. After you disabled encryption, you can verify that encryption
  is not applied by inspecting the API response from `PutRecord` or
  `PutRecords`.
  """
  def stop_stream_encryption(client, input, options \\ []) do
    request(client, "StopStreamEncryption", input, options)
  end

  @doc """
  Call this operation from your consumer after you call
  `RegisterStreamConsumer` to register the consumer with Kinesis Data
  Streams. If the call succeeds, your consumer starts receiving events of
  type `SubscribeToShardEvent` for up to 5 minutes, after which time you need
  to call `SubscribeToShard` again to renew the subscription if you want to
  continue to receive records.

  You can make one call to `SubscribeToShard` per second per `ConsumerARN`.
  If your call succeeds, and then you call the operation again less than 5
  seconds later, the second call generates a `ResourceInUseException`. If you
  call the operation a second time more than 5 seconds after the first call
  succeeds, the second call succeeds and the first connection gets shut down.
  """
  def subscribe_to_shard(client, input, options \\ []) do
    request(client, "SubscribeToShard", input, options)
  end

  @doc """
  Updates the shard count of the specified stream to the specified number of
  shards.

  Updating the shard count is an asynchronous operation. Upon receiving the
  request, Kinesis Data Streams returns immediately and sets the status of
  the stream to `UPDATING`. After the update is complete, Kinesis Data
  Streams sets the status of the stream back to `ACTIVE`. Depending on the
  size of the stream, the scaling action could take a few minutes to
  complete. You can continue to read and write data to your stream while its
  status is `UPDATING`.

  To update the shard count, Kinesis Data Streams performs splits or merges
  on individual shards. This can cause short-lived shards to be created, in
  addition to the final shards. We recommend that you double or halve the
  shard count, as this results in the fewest number of splits or merges.

  This operation has the following default limits. By default, you cannot do
  the following:

  <ul> <li> Scale more than twice per rolling 24-hour period per stream

  </li> <li> Scale up to more than double your current shard count for a
  stream

  </li> <li> Scale down below half your current shard count for a stream

  </li> <li> Scale up to more than 500 shards in a stream

  </li> <li> Scale a stream with more than 500 shards down unless the result
  is less than 500 shards

  </li> <li> Scale up to more than the shard limit for your account

  </li> </ul> For the default limits for an AWS account, see [Streams
  Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  in the *Amazon Kinesis Data Streams Developer Guide*. To request an
  increase in the call rate limit, the shard limit for this API, or your
  overall shard limit, use the [limits
  form](https://console.aws.amazon.com/support/v1#/case/create?issueType=service-limit-increase&amp;limitType=service-code-kinesis).
  """
  def update_shard_count(client, input, options \\ []) do
    request(client, "UpdateShardCount", input, options)
  end

  @spec request(map(), binary(), map(), list()) ::
    {:ok, map() | nil, map()} |
    {:error, map()} |
    {:error, HTTPoison.Error.t}
  defp request(client, action, input, options) do
    client = %{client | service: "kinesis"}
    host = get_host("kinesis", client)
    url = get_url(host, client)
    headers = [{"Host", host},
               {"Content-Type", "application/x-amz-json-1.1"},
               {"X-Amz-Target", "Kinesis_20131202.#{action}"}]
    payload = Jason.encode!(input)
    headers = AWS.Request.sign_v4(client, "POST", url, headers, payload)
    case HTTPoison.post(url, payload, headers, options) do
      {:ok, response=%HTTPoison.Response{status_code: 200, body: ""}} ->
        {:ok, nil, response}
      {:ok, response=%HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body), response}
      {:ok, _response=%HTTPoison.Response{body: body}} ->
        error = Jason.decode!(body)
        exception = error["__type"]
        message = error["message"]
        {:error, {exception, message}}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %HTTPoison.Error{reason: reason}}
    end
  end

  defp get_host(endpoint_prefix, client) do
    if client.region == "local" do
      "localhost"
    else
      "#{endpoint_prefix}.#{client.region}.#{client.endpoint}"
    end
  end

  defp get_url(host, %{:proto => proto, :port => port}) do
    "#{proto}://#{host}:#{port}/"
  end

end
