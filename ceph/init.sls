# -*- coding: utf-8 -*-
# vim: ft=yaml

{% from "ceph/map.jinja" import settings with context -%}

install_ceph_pkgs:
  pkg.installed:
    - pkgs: {{ settings.packages }}
