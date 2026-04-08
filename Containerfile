FROM ghcr.io/frappe/erpnext:v15

ARG APPS_JSON_BASE64=W3sidXJsIjogImh0dHBzOi8vZ2l0aHViLmNvbS9mcmFwcGUvY3JtIiwgImJyYW5jaCI6ICJ2ZXJzaW9uLTE1In0sIHsidXJsIjogImh0dHBzOi8vZ2l0aHViLmNvbS9zaHJpZGFycGF0aWwvZnJhcHBlX3doYXRzYXBwIiwgImJyYW5jaCI6ICJtYWluIn1d

RUN echo "${APPS_JSON_BASE64}" | base64 -d > /apps.json && \
    cat /apps.json

USER frappe
WORKDIR /home/frappe/frappe-bench

RUN bench get-app --apps_path /apps.json

USER root
