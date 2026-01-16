{{/*
Common labels
*/}}
{{- define "jaehyeong-tech.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | default "1.0.0" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Web selector labels
*/}}
{{- define "jaehyeong-tech.web.selectorLabels" -}}
app: {{ .Release.Name }}-web
component: web
{{- end }}

{{/*
Service selector labels (for MSA services)
*/}}
{{- define "jaehyeong-tech.service.selectorLabels" -}}
app: {{ .Release.Name }}-{{ .name }}
component: {{ .name }}
{{- end }}
