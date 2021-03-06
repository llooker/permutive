view: segmententry_events {
  sql_table_name: burda_forward.segmententry_events ;;

  dimension: event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: partition_date {
    type: date
    sql:  ${TABLE}._PARTITIONTIME ;;
  }

  dimension: properties__client__domain {
    type: string
    sql: ${TABLE}.properties.client.domain ;;
  }

  dimension: properties__client__referrer {
    type: string
    sql: ${TABLE}.properties.client.referrer ;;
  }

  dimension: properties__client__title {
    type: string
    sql: ${TABLE}.properties.client.title ;;
  }

  dimension: properties__client__type {
    type: string
    sql: ${TABLE}.properties.client.type ;;
  }

  dimension: properties__client__url {
    type: string
    sql: ${TABLE}.properties.client.url ;;
  }

  dimension: properties__client__user_agent {
    type: string
    sql: ${TABLE}.properties.client.user_agent ;;
  }

  dimension: properties__custom_id {
    type: string
    sql: ${TABLE}.properties.custom_id ;;
  }

  dimension: properties__segment_code {
    type: string
    sql: ${TABLE}.properties.segment_code ;;
  }

  dimension: properties__segment_id {
    type: string
    sql: ${TABLE}.properties.segment_id ;;
  }

  dimension: properties__segment_name {
    type: string
    view_label: "Segments"
    sql: ${TABLE}.properties.segment_name ;;
  }

  dimension: properties__segment_number {
    type: number
    sql: ${TABLE}.properties.segment_number ;;
  }

  dimension: segments {
    type: number
    sql: ${TABLE}.segments ;;
    hidden: yes
    fanout_on: "segments"
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }



  measure: uniques {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: cumulative_uniques {
    type: running_total
    sql: ${uniques} ;;
    direction:"column"
  }
}
