---
name: auth
description: Authentication and authorization — design auth flows, JWT setup, RBAC models, OAuth integration, session management
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: flow|jwt|rbac|oauth|review|session> <target>"
---

# Authentication & Authorization

Action: $ARGUMENTS

## Actions

### `flow` <description>
Design an auth flow for the use case:
1. Choose approach (JWT, session, API key, OAuth)
2. Design the flow diagram (login → token → refresh → logout)
3. Define token/session lifecycle
4. Generate implementation skeleton

### `jwt` <framework>
Implement JWT authentication:
1. Generate JWT creation and validation code
2. Setup access + refresh token pair
3. Add middleware/guard for protected routes
4. Handle token refresh endpoint
5. Configure secure cookie storage (web) or secure storage (mobile)

### `rbac` <description>
Design role-based access control:
1. Define roles and permissions
2. Design permission checking middleware
3. Generate role/permission models
4. Add route/endpoint guards
5. Handle hierarchical permissions if needed

### `oauth` <provider>
Integrate OAuth 2.0 provider:
1. Setup OAuth client (Auth0, Google, GitHub, Okta)
2. Implement Authorization Code + PKCE flow
3. Handle callback, token exchange, user creation
4. Map external identity to local user model
5. Setup session after OAuth completion

### `review` <file-or-directory>
Security review of auth implementation:
1. Check token storage (no localStorage for web)
2. Check password hashing (bcrypt/argon2)
3. Check rate limiting on auth endpoints
4. Check CSRF protection
5. Check permission enforcement at service layer
6. Check token validation (signature, expiry, audience)

### `session` <framework>
Implement session-based auth:
1. Setup session store (Redis, DB)
2. Configure session cookie (httpOnly, secure, SameSite)
3. Add session middleware
4. Handle login/logout/session regeneration
5. Add CSRF protection
