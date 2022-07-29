--To disable this model, set the using_domain_names variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_domain_names', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='domain_name',
        database_variable='zendesk_database',
        schema_variable='zendesk_schema',
        default_database=target.database,
        default_schema='zendesk_support',
        default_variable='domain_name'
    )
}}
