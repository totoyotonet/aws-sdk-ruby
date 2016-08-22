# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module ElasticsearchService
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs
      include Aws::ClientWaiters

      @identifier = :elasticsearchservice

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::HelpfulSocketErrors)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::RequestSigner)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::Protocols::RestJson)

      # @!group API Operations

      # Attaches tags to an existing Elasticsearch domain. Tags are a set of
      # case-sensitive key value pairs. An Elasticsearch domain may have up to
      # 10 tags. See [ Tagging Amazon Elasticsearch Service Domains for more
      # information.][1]
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging
      # @option params [required, String] :arn
      #   Specify the `ARN` for which you want to add the tags.
      # @option params [required, Array<Types::Tag>] :tag_list
      #   List of `Tag` that need to be added for the Elasticsearch domain.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.add_tags({
      #     arn: "ARN", # required
      #     tag_list: [ # required
      #       {
      #         key: "TagKey", # required
      #         value: "TagValue", # required
      #       },
      #     ],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def add_tags(params = {}, options = {})
        req = build_request(:add_tags, params)
        req.send_request(options)
      end

      # Creates a new Elasticsearch domain. For more information, see
      # [Creating Elasticsearch Domains][1] in the *Amazon Elasticsearch
      # Service Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains
      # @option params [required, String] :domain_name
      #   The name of the Elasticsearch domain that you are creating. Domain
      #   names are unique across the domains owned by an account within an AWS
      #   region. Domain names must start with a letter or number and can
      #   contain the following characters: a-z (lowercase), 0-9, and -
      #   (hyphen).
      # @option params [Types::ElasticsearchClusterConfig] :elasticsearch_cluster_config
      #   Configuration options for an Elasticsearch domain. Specifies the
      #   instance type and number of instances in the domain cluster.
      # @option params [Types::EBSOptions] :ebs_options
      #   Options to enable, disable and specify the type and size of EBS
      #   storage volumes.
      # @option params [String] :access_policies
      #   IAM access policy as a JSON-formatted string.
      # @option params [Types::SnapshotOptions] :snapshot_options
      #   Option to set time, in UTC format, of the daily automated snapshot.
      #   Default value is 0 hours.
      # @option params [Hash<String,String>] :advanced_options
      #   Option to allow references to indices in an HTTP request body. Must be
      #   `false` when configuring access to individual sub-resources. By
      #   default, the value is `true`. See [Configuration Advanced Options][1]
      #   for more information.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options
      # @return [Types::CreateElasticsearchDomainResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateElasticsearchDomainResponse#domain_status #DomainStatus} => Types::ElasticsearchDomainStatus
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_elasticsearch_domain({
      #     domain_name: "DomainName", # required
      #     elasticsearch_cluster_config: {
      #       instance_type: "m3.medium.elasticsearch", # accepts m3.medium.elasticsearch, m3.large.elasticsearch, m3.xlarge.elasticsearch, m3.2xlarge.elasticsearch, t2.micro.elasticsearch, t2.small.elasticsearch, t2.medium.elasticsearch, r3.large.elasticsearch, r3.xlarge.elasticsearch, r3.2xlarge.elasticsearch, r3.4xlarge.elasticsearch, r3.8xlarge.elasticsearch, i2.xlarge.elasticsearch, i2.2xlarge.elasticsearch
      #       instance_count: 1,
      #       dedicated_master_enabled: false,
      #       zone_awareness_enabled: false,
      #       dedicated_master_type: "m3.medium.elasticsearch", # accepts m3.medium.elasticsearch, m3.large.elasticsearch, m3.xlarge.elasticsearch, m3.2xlarge.elasticsearch, t2.micro.elasticsearch, t2.small.elasticsearch, t2.medium.elasticsearch, r3.large.elasticsearch, r3.xlarge.elasticsearch, r3.2xlarge.elasticsearch, r3.4xlarge.elasticsearch, r3.8xlarge.elasticsearch, i2.xlarge.elasticsearch, i2.2xlarge.elasticsearch
      #       dedicated_master_count: 1,
      #     },
      #     ebs_options: {
      #       ebs_enabled: false,
      #       volume_type: "standard", # accepts standard, gp2, io1
      #       volume_size: 1,
      #       iops: 1,
      #     },
      #     access_policies: "PolicyDocument",
      #     snapshot_options: {
      #       automated_snapshot_start_hour: 1,
      #     },
      #     advanced_options: {
      #       "String" => "String",
      #     },
      #   })
      #
      # @example Response structure
      #   resp.domain_status.domain_id #=> String
      #   resp.domain_status.domain_name #=> String
      #   resp.domain_status.arn #=> String
      #   resp.domain_status.created #=> Boolean
      #   resp.domain_status.deleted #=> Boolean
      #   resp.domain_status.endpoint #=> String
      #   resp.domain_status.processing #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.instance_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status.elasticsearch_cluster_config.instance_count #=> Integer
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_enabled #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.zone_awareness_enabled #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_count #=> Integer
      #   resp.domain_status.ebs_options.ebs_enabled #=> Boolean
      #   resp.domain_status.ebs_options.volume_type #=> String, one of "standard", "gp2", "io1"
      #   resp.domain_status.ebs_options.volume_size #=> Integer
      #   resp.domain_status.ebs_options.iops #=> Integer
      #   resp.domain_status.access_policies #=> String
      #   resp.domain_status.snapshot_options.automated_snapshot_start_hour #=> Integer
      #   resp.domain_status.advanced_options #=> Hash
      #   resp.domain_status.advanced_options["String"] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_elasticsearch_domain(params = {}, options = {})
        req = build_request(:create_elasticsearch_domain, params)
        req.send_request(options)
      end

      # Permanently deletes the specified Elasticsearch domain and all of its
      # data. Once a domain is deleted, it cannot be recovered.
      # @option params [required, String] :domain_name
      #   The name of the Elasticsearch domain that you want to permanently
      #   delete.
      # @return [Types::DeleteElasticsearchDomainResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DeleteElasticsearchDomainResponse#domain_status #DomainStatus} => Types::ElasticsearchDomainStatus
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_elasticsearch_domain({
      #     domain_name: "DomainName", # required
      #   })
      #
      # @example Response structure
      #   resp.domain_status.domain_id #=> String
      #   resp.domain_status.domain_name #=> String
      #   resp.domain_status.arn #=> String
      #   resp.domain_status.created #=> Boolean
      #   resp.domain_status.deleted #=> Boolean
      #   resp.domain_status.endpoint #=> String
      #   resp.domain_status.processing #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.instance_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status.elasticsearch_cluster_config.instance_count #=> Integer
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_enabled #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.zone_awareness_enabled #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_count #=> Integer
      #   resp.domain_status.ebs_options.ebs_enabled #=> Boolean
      #   resp.domain_status.ebs_options.volume_type #=> String, one of "standard", "gp2", "io1"
      #   resp.domain_status.ebs_options.volume_size #=> Integer
      #   resp.domain_status.ebs_options.iops #=> Integer
      #   resp.domain_status.access_policies #=> String
      #   resp.domain_status.snapshot_options.automated_snapshot_start_hour #=> Integer
      #   resp.domain_status.advanced_options #=> Hash
      #   resp.domain_status.advanced_options["String"] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_elasticsearch_domain(params = {}, options = {})
        req = build_request(:delete_elasticsearch_domain, params)
        req.send_request(options)
      end

      # Returns domain configuration information about the specified
      # Elasticsearch domain, including the domain ID, domain endpoint, and
      # domain ARN.
      # @option params [required, String] :domain_name
      #   The name of the Elasticsearch domain for which you want information.
      # @return [Types::DescribeElasticsearchDomainResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeElasticsearchDomainResponse#domain_status #DomainStatus} => Types::ElasticsearchDomainStatus
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_elasticsearch_domain({
      #     domain_name: "DomainName", # required
      #   })
      #
      # @example Response structure
      #   resp.domain_status.domain_id #=> String
      #   resp.domain_status.domain_name #=> String
      #   resp.domain_status.arn #=> String
      #   resp.domain_status.created #=> Boolean
      #   resp.domain_status.deleted #=> Boolean
      #   resp.domain_status.endpoint #=> String
      #   resp.domain_status.processing #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.instance_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status.elasticsearch_cluster_config.instance_count #=> Integer
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_enabled #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.zone_awareness_enabled #=> Boolean
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status.elasticsearch_cluster_config.dedicated_master_count #=> Integer
      #   resp.domain_status.ebs_options.ebs_enabled #=> Boolean
      #   resp.domain_status.ebs_options.volume_type #=> String, one of "standard", "gp2", "io1"
      #   resp.domain_status.ebs_options.volume_size #=> Integer
      #   resp.domain_status.ebs_options.iops #=> Integer
      #   resp.domain_status.access_policies #=> String
      #   resp.domain_status.snapshot_options.automated_snapshot_start_hour #=> Integer
      #   resp.domain_status.advanced_options #=> Hash
      #   resp.domain_status.advanced_options["String"] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_elasticsearch_domain(params = {}, options = {})
        req = build_request(:describe_elasticsearch_domain, params)
        req.send_request(options)
      end

      # Provides cluster configuration information about the specified
      # Elasticsearch domain, such as the state, creation date, update
      # version, and update date for cluster options.
      # @option params [required, String] :domain_name
      #   The Elasticsearch domain that you want to get information about.
      # @return [Types::DescribeElasticsearchDomainConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeElasticsearchDomainConfigResponse#domain_config #DomainConfig} => Types::ElasticsearchDomainConfig
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_elasticsearch_domain_config({
      #     domain_name: "DomainName", # required
      #   })
      #
      # @example Response structure
      #   resp.domain_config.elasticsearch_cluster_config.options.instance_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_config.elasticsearch_cluster_config.options.instance_count #=> Integer
      #   resp.domain_config.elasticsearch_cluster_config.options.dedicated_master_enabled #=> Boolean
      #   resp.domain_config.elasticsearch_cluster_config.options.zone_awareness_enabled #=> Boolean
      #   resp.domain_config.elasticsearch_cluster_config.options.dedicated_master_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_config.elasticsearch_cluster_config.options.dedicated_master_count #=> Integer
      #   resp.domain_config.elasticsearch_cluster_config.status.creation_date #=> Time
      #   resp.domain_config.elasticsearch_cluster_config.status.update_date #=> Time
      #   resp.domain_config.elasticsearch_cluster_config.status.update_version #=> Integer
      #   resp.domain_config.elasticsearch_cluster_config.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.elasticsearch_cluster_config.status.pending_deletion #=> Boolean
      #   resp.domain_config.ebs_options.options.ebs_enabled #=> Boolean
      #   resp.domain_config.ebs_options.options.volume_type #=> String, one of "standard", "gp2", "io1"
      #   resp.domain_config.ebs_options.options.volume_size #=> Integer
      #   resp.domain_config.ebs_options.options.iops #=> Integer
      #   resp.domain_config.ebs_options.status.creation_date #=> Time
      #   resp.domain_config.ebs_options.status.update_date #=> Time
      #   resp.domain_config.ebs_options.status.update_version #=> Integer
      #   resp.domain_config.ebs_options.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.ebs_options.status.pending_deletion #=> Boolean
      #   resp.domain_config.access_policies.options #=> String
      #   resp.domain_config.access_policies.status.creation_date #=> Time
      #   resp.domain_config.access_policies.status.update_date #=> Time
      #   resp.domain_config.access_policies.status.update_version #=> Integer
      #   resp.domain_config.access_policies.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.access_policies.status.pending_deletion #=> Boolean
      #   resp.domain_config.snapshot_options.options.automated_snapshot_start_hour #=> Integer
      #   resp.domain_config.snapshot_options.status.creation_date #=> Time
      #   resp.domain_config.snapshot_options.status.update_date #=> Time
      #   resp.domain_config.snapshot_options.status.update_version #=> Integer
      #   resp.domain_config.snapshot_options.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.snapshot_options.status.pending_deletion #=> Boolean
      #   resp.domain_config.advanced_options.options #=> Hash
      #   resp.domain_config.advanced_options.options["String"] #=> String
      #   resp.domain_config.advanced_options.status.creation_date #=> Time
      #   resp.domain_config.advanced_options.status.update_date #=> Time
      #   resp.domain_config.advanced_options.status.update_version #=> Integer
      #   resp.domain_config.advanced_options.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.advanced_options.status.pending_deletion #=> Boolean
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_elasticsearch_domain_config(params = {}, options = {})
        req = build_request(:describe_elasticsearch_domain_config, params)
        req.send_request(options)
      end

      # Returns domain configuration information about the specified
      # Elasticsearch domains, including the domain ID, domain endpoint, and
      # domain ARN.
      # @option params [required, Array<String>] :domain_names
      #   The Elasticsearch domains for which you want information.
      # @return [Types::DescribeElasticsearchDomainsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeElasticsearchDomainsResponse#domain_status_list #DomainStatusList} => Array&lt;Types::ElasticsearchDomainStatus&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_elasticsearch_domains({
      #     domain_names: ["DomainName"], # required
      #   })
      #
      # @example Response structure
      #   resp.domain_status_list #=> Array
      #   resp.domain_status_list[0].domain_id #=> String
      #   resp.domain_status_list[0].domain_name #=> String
      #   resp.domain_status_list[0].arn #=> String
      #   resp.domain_status_list[0].created #=> Boolean
      #   resp.domain_status_list[0].deleted #=> Boolean
      #   resp.domain_status_list[0].endpoint #=> String
      #   resp.domain_status_list[0].processing #=> Boolean
      #   resp.domain_status_list[0].elasticsearch_cluster_config.instance_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status_list[0].elasticsearch_cluster_config.instance_count #=> Integer
      #   resp.domain_status_list[0].elasticsearch_cluster_config.dedicated_master_enabled #=> Boolean
      #   resp.domain_status_list[0].elasticsearch_cluster_config.zone_awareness_enabled #=> Boolean
      #   resp.domain_status_list[0].elasticsearch_cluster_config.dedicated_master_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_status_list[0].elasticsearch_cluster_config.dedicated_master_count #=> Integer
      #   resp.domain_status_list[0].ebs_options.ebs_enabled #=> Boolean
      #   resp.domain_status_list[0].ebs_options.volume_type #=> String, one of "standard", "gp2", "io1"
      #   resp.domain_status_list[0].ebs_options.volume_size #=> Integer
      #   resp.domain_status_list[0].ebs_options.iops #=> Integer
      #   resp.domain_status_list[0].access_policies #=> String
      #   resp.domain_status_list[0].snapshot_options.automated_snapshot_start_hour #=> Integer
      #   resp.domain_status_list[0].advanced_options #=> Hash
      #   resp.domain_status_list[0].advanced_options["String"] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_elasticsearch_domains(params = {}, options = {})
        req = build_request(:describe_elasticsearch_domains, params)
        req.send_request(options)
      end

      # Returns the name of all Elasticsearch domains owned by the current
      # user\'s account.
      # @return [Types::ListDomainNamesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListDomainNamesResponse#domain_names #DomainNames} => Array&lt;Types::DomainInfo&gt;
      #
      # @example Response structure
      #   resp.domain_names #=> Array
      #   resp.domain_names[0].domain_name #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_domain_names(params = {}, options = {})
        req = build_request(:list_domain_names, params)
        req.send_request(options)
      end

      # Returns all tags for the given Elasticsearch domain.
      # @option params [required, String] :arn
      #   Specify the `ARN` for the Elasticsearch domain to which the tags are
      #   attached that you want to view.
      # @return [Types::ListTagsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListTagsResponse#tag_list #TagList} => Array&lt;Types::Tag&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_tags({
      #     arn: "ARN", # required
      #   })
      #
      # @example Response structure
      #   resp.tag_list #=> Array
      #   resp.tag_list[0].key #=> String
      #   resp.tag_list[0].value #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_tags(params = {}, options = {})
        req = build_request(:list_tags, params)
        req.send_request(options)
      end

      # Removes the specified set of tags from the specified Elasticsearch
      # domain.
      # @option params [required, String] :arn
      #   Specifies the `ARN` for the Elasticsearch domain from which you want
      #   to delete the specified tags.
      # @option params [required, Array<String>] :tag_keys
      #   Specifies the `TagKey` list which you want to remove from the
      #   Elasticsearch domain.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.remove_tags({
      #     arn: "ARN", # required
      #     tag_keys: ["String"], # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def remove_tags(params = {}, options = {})
        req = build_request(:remove_tags, params)
        req.send_request(options)
      end

      # Modifies the cluster configuration of the specified Elasticsearch
      # domain, setting as setting the instance type and the number of
      # instances.
      # @option params [required, String] :domain_name
      #   The name of the Elasticsearch domain that you are updating.
      # @option params [Types::ElasticsearchClusterConfig] :elasticsearch_cluster_config
      #   The type and number of instances to instantiate for the domain
      #   cluster.
      # @option params [Types::EBSOptions] :ebs_options
      #   Specify the type and size of the EBS volume that you want to use.
      # @option params [Types::SnapshotOptions] :snapshot_options
      #   Option to set the time, in UTC format, for the daily automated
      #   snapshot. Default value is `0` hours.
      # @option params [Hash<String,String>] :advanced_options
      #   Modifies the advanced option to allow references to indices in an HTTP
      #   request body. Must be `false` when configuring access to individual
      #   sub-resources. By default, the value is `true`. See [Configuration
      #   Advanced Options][1] for more information.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options
      # @option params [String] :access_policies
      #   IAM access policy as a JSON-formatted string.
      # @return [Types::UpdateElasticsearchDomainConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::UpdateElasticsearchDomainConfigResponse#domain_config #DomainConfig} => Types::ElasticsearchDomainConfig
      #
      # @example Request syntax with placeholder values
      #   resp = client.update_elasticsearch_domain_config({
      #     domain_name: "DomainName", # required
      #     elasticsearch_cluster_config: {
      #       instance_type: "m3.medium.elasticsearch", # accepts m3.medium.elasticsearch, m3.large.elasticsearch, m3.xlarge.elasticsearch, m3.2xlarge.elasticsearch, t2.micro.elasticsearch, t2.small.elasticsearch, t2.medium.elasticsearch, r3.large.elasticsearch, r3.xlarge.elasticsearch, r3.2xlarge.elasticsearch, r3.4xlarge.elasticsearch, r3.8xlarge.elasticsearch, i2.xlarge.elasticsearch, i2.2xlarge.elasticsearch
      #       instance_count: 1,
      #       dedicated_master_enabled: false,
      #       zone_awareness_enabled: false,
      #       dedicated_master_type: "m3.medium.elasticsearch", # accepts m3.medium.elasticsearch, m3.large.elasticsearch, m3.xlarge.elasticsearch, m3.2xlarge.elasticsearch, t2.micro.elasticsearch, t2.small.elasticsearch, t2.medium.elasticsearch, r3.large.elasticsearch, r3.xlarge.elasticsearch, r3.2xlarge.elasticsearch, r3.4xlarge.elasticsearch, r3.8xlarge.elasticsearch, i2.xlarge.elasticsearch, i2.2xlarge.elasticsearch
      #       dedicated_master_count: 1,
      #     },
      #     ebs_options: {
      #       ebs_enabled: false,
      #       volume_type: "standard", # accepts standard, gp2, io1
      #       volume_size: 1,
      #       iops: 1,
      #     },
      #     snapshot_options: {
      #       automated_snapshot_start_hour: 1,
      #     },
      #     advanced_options: {
      #       "String" => "String",
      #     },
      #     access_policies: "PolicyDocument",
      #   })
      #
      # @example Response structure
      #   resp.domain_config.elasticsearch_cluster_config.options.instance_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_config.elasticsearch_cluster_config.options.instance_count #=> Integer
      #   resp.domain_config.elasticsearch_cluster_config.options.dedicated_master_enabled #=> Boolean
      #   resp.domain_config.elasticsearch_cluster_config.options.zone_awareness_enabled #=> Boolean
      #   resp.domain_config.elasticsearch_cluster_config.options.dedicated_master_type #=> String, one of "m3.medium.elasticsearch", "m3.large.elasticsearch", "m3.xlarge.elasticsearch", "m3.2xlarge.elasticsearch", "t2.micro.elasticsearch", "t2.small.elasticsearch", "t2.medium.elasticsearch", "r3.large.elasticsearch", "r3.xlarge.elasticsearch", "r3.2xlarge.elasticsearch", "r3.4xlarge.elasticsearch", "r3.8xlarge.elasticsearch", "i2.xlarge.elasticsearch", "i2.2xlarge.elasticsearch"
      #   resp.domain_config.elasticsearch_cluster_config.options.dedicated_master_count #=> Integer
      #   resp.domain_config.elasticsearch_cluster_config.status.creation_date #=> Time
      #   resp.domain_config.elasticsearch_cluster_config.status.update_date #=> Time
      #   resp.domain_config.elasticsearch_cluster_config.status.update_version #=> Integer
      #   resp.domain_config.elasticsearch_cluster_config.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.elasticsearch_cluster_config.status.pending_deletion #=> Boolean
      #   resp.domain_config.ebs_options.options.ebs_enabled #=> Boolean
      #   resp.domain_config.ebs_options.options.volume_type #=> String, one of "standard", "gp2", "io1"
      #   resp.domain_config.ebs_options.options.volume_size #=> Integer
      #   resp.domain_config.ebs_options.options.iops #=> Integer
      #   resp.domain_config.ebs_options.status.creation_date #=> Time
      #   resp.domain_config.ebs_options.status.update_date #=> Time
      #   resp.domain_config.ebs_options.status.update_version #=> Integer
      #   resp.domain_config.ebs_options.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.ebs_options.status.pending_deletion #=> Boolean
      #   resp.domain_config.access_policies.options #=> String
      #   resp.domain_config.access_policies.status.creation_date #=> Time
      #   resp.domain_config.access_policies.status.update_date #=> Time
      #   resp.domain_config.access_policies.status.update_version #=> Integer
      #   resp.domain_config.access_policies.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.access_policies.status.pending_deletion #=> Boolean
      #   resp.domain_config.snapshot_options.options.automated_snapshot_start_hour #=> Integer
      #   resp.domain_config.snapshot_options.status.creation_date #=> Time
      #   resp.domain_config.snapshot_options.status.update_date #=> Time
      #   resp.domain_config.snapshot_options.status.update_version #=> Integer
      #   resp.domain_config.snapshot_options.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.snapshot_options.status.pending_deletion #=> Boolean
      #   resp.domain_config.advanced_options.options #=> Hash
      #   resp.domain_config.advanced_options.options["String"] #=> String
      #   resp.domain_config.advanced_options.status.creation_date #=> Time
      #   resp.domain_config.advanced_options.status.update_date #=> Time
      #   resp.domain_config.advanced_options.status.update_version #=> Integer
      #   resp.domain_config.advanced_options.status.state #=> String, one of "RequiresIndexDocuments", "Processing", "Active"
      #   resp.domain_config.advanced_options.status.pending_deletion #=> Boolean
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def update_elasticsearch_domain_config(params = {}, options = {})
        req = build_request(:update_elasticsearch_domain_config, params)
        req.send_request(options)
      end

      # @!endgroup

      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {}
      end

      # @api private
      class << self

        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end