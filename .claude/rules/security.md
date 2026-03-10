---
description: Security requirements for all code
---

# Security

- Never hardcode secrets, tokens, or credentials — use environment variables
- Validate all user input at system boundaries (API handlers, CLI parsers)
- Use parameterized queries — never concatenate user input into SQL
- Sanitize output for the target context (HTML encoding, shell escaping)
- Set secure defaults: HTTPS, secure cookies, restrictive CORS
- Log security-relevant events but never log secrets or PII
- Keep dependencies updated — run `npm audit` or equivalent regularly
- Use the principle of least privilege for file permissions and API scopes
