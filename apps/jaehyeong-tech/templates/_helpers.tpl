{{/*
Common labels
*/}}
{{- define "jaehyeong-tech.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
API selector labels
*/}}
{{- define "jaehyeong-tech.api.selectorLabels" -}}
app: {{ .Release.Name }}-api
component: api
{{- end }}

{{/*
Web selector labels
*/}}
{{- define "jaehyeong-tech.web.selectorLabels" -}}
app: {{ .Release.Name }}-web
component: web
{{- end }}

{{/*
Database URL helper
*/}}
{{- define "jaehyeong-tech.databaseUrl" -}}
postgresql://{{ .Values.postgresql.auth.username }}:$(DB_PASSWORD)@{{ .Release.Name }}-postgresql:5432/{{ .Values.postgresql.auth.database }}
{{- end }}
