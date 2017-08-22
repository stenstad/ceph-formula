# -*- coding: utf-8 -*-
# vim: ft=yaml

{% from "ceph/map.jinja" import settings with context -%}

{% set mds_name = grains['host'] %}
{% set mds_dir = '/var/lib/ceph/mds/mds.' ~ mds_name %}

ceph_config_mds_host:
  ini.options_present:
    - name: /etc/ceph/{{ settings.cluster_name }}.conf
    - sections:
        mds:
          mds data: '/var/lib/ceph/mds/mds.$id'
          keyring: '/var/lib/ceph/mds/mds.$id/keyring'
        mds.{{ mds_name }}:
          host: {{ mds_name }}

mkdir_dir_for_{{ mds_name }}:
  file.directory:
    - name: {{ mds_dir }}
    - user: ceph
    - group: ceph

start_mds_service_for_{{ mds_name }}:
  service.running:
     - name: ceph-mds@{{ mds_name }}
