SELECT 
    trigger_catalog,
    trigger_schema,
    trigger_name,
    string_agg(event_manipulation, ' OR ' order by event_manipulation ASC) AS event_manipulation,
    event_object_schema,
    event_object_table,
    action_statement,
    action_orientation,
    action_timing
FROM information_schema.triggers
GROUP BY
    trigger_catalog,
    trigger_schema,
    trigger_name,
    event_object_schema,
    event_object_table,
    action_statement,
    action_orientation,
    action_timing
ORDER BY event_manipulation ASC;
