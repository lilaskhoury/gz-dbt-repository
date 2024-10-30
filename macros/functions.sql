{% macro margin_percent(margin, revenue) %}
    ({{ margin }} / NULLIF({{ revenue }}, 0)) * 100
{% endmacro %}
FROM {{ ref('finance_days') }}
