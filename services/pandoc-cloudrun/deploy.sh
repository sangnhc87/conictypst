#!/usr/bin/env bash
set -e

# Tên service trên Cloud Run
SERVICE_NAME="pandoc-docx-service"
REGION="asia-southeast1"

echo "🚀 Bắt đầu deploy $SERVICE_NAME lên Google Cloud Run ($REGION)..."

# Deploy trực tiếp từ mã nguồn hiện tại (Cloud Build sẽ build container theo Dockerfile)
gcloud run deploy "$SERVICE_NAME" \
  --source . \
  --platform managed \
  --region "$REGION" \
  --allow-unauthenticated \
  --min-instances 0 \
  --max-instances 5 \
  --memory 1Gi \
  --cpu 1 \
  --timeout 60

echo "✅ Deploy hoàn tất! Lấy URL service:"
gcloud run services describe "$SERVICE_NAME" --platform managed --region "$REGION" --format 'value(status.url)'
