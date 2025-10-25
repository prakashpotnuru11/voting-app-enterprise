#!/bin/bash

set -e

echo "🚀 Deploying Enterprise Voting App Components..."

# Apply infrastructure (RBAC, quotas, etc.)
kubectl apply -f infrastructure/ -n voting-app

# Apply configurations
kubectl apply -f config/ -n voting-app

# Apply networking
kubectl apply -f ingress/ -n voting-app

# Apply monitoring
kubectl apply -f monitoring/ -n voting-app

# Apply core application
kubectl apply -f deployments/ -f services/ -n voting-app

echo "✅ Enterprise components deployed successfully!"
echo "📊 Check resources: kubectl get all -n voting-app"
echo "🌐 Check ingress: kubectl get ingress -n voting-app"
echo "🔐 Check network policies: kubectl get networkpolicies -n voting-app"
