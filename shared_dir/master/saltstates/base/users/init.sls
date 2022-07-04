{% for user, data in salt['pillar.get']('linux_users', {}).items() %}
user_{{ user }}:
  user.present:
    - name: {{ data['username'] }}
    - fullname: {{ data['fullname'] }}
    - shell: {{ data['shell'] }}
    - groups: {{ data['groups'] }}
    - usergroup: True

{{ user }}_key:
  ssh_auth.present:
    - name: {{ data['ssh_key'] }}
    - user: {{ data['username'] }}

{% endfor %}