# -*- coding: utf-8 -*-
# vim: ft=yaml

{% from "ceph/map.jinja" import settings with context -%}

{%- if grains['os_family'] == 'Debian' %}
ceph-repo:
  pkgrepo.managed:
    - humanname: Ceph Repository
    - name: deb http://download.ceph.com/debian-{{ settings.release }}/ {{ grains.oscodename }} main
    - key_url: https://download.ceph.com/keys/release.asc
    - clean_file: True
    - file: /etc/apt/sources.list.d/ceph.list
{%- endif %}
