{% macro cents_to_dollars(column_name, decimals=2) %}
    round(cast({{ column_name }} as numeric) / 100, {{ decimals }})
{% endmacro %}