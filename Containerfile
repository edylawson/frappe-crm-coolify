FROM frappe/erpnext:v15

ARG APPS_JSON_BASE64=W3sidXJsIjogImh0dHBzOi8vZ2l0aHViLmNvbS9mcmFwcGUvY3JtIiwgImJyYW5jaCI6ICJ2ZXJzaW9uLTE1In1d

RUN printf '%s' "$APPS_JSON_BASE64" | base64 -d > /apps.json && \
    cat /apps.json

USER frappe
WORKDIR /home/frappe/frappe-bench

RUN bench get-app --apps_path /apps.json

USER root
