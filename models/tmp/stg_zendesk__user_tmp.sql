{{
    fivetran_utils.union_data(
        table_identifier='user',
        database_variable='zendesk_database',
        schema_variable='zendesk_schema',
        default_database=target.database,
        default_schema='zendesk_support',
        default_variable='user'
    )
}}
