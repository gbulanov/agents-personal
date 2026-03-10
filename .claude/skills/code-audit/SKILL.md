---
name: code-audit
description: Perform a security and quality audit on code files or directories
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[file path, directory, or 'full' for entire project]"
---

# Code Audit

Perform a security and code quality audit.

## Target

Audit target: $ARGUMENTS

If "full" or no arguments, audit the entire project. Otherwise audit the specified path.

## Audit Checklist

### Security (OWASP Top 10)
- [ ] Injection flaws (SQL, NoSQL, OS command, LDAP)
- [ ] Broken authentication (hardcoded creds, weak session handling)
- [ ] Sensitive data exposure (logging secrets, unencrypted storage)
- [ ] XML/JSON external entities
- [ ] Broken access control (missing auth checks, IDOR)
- [ ] Security misconfiguration (debug mode, default creds, open CORS)
- [ ] XSS (reflected, stored, DOM-based)
- [ ] Insecure deserialization
- [ ] Known vulnerable dependencies (check package.json/requirements.txt)
- [ ] Insufficient logging and monitoring

### Code Quality
- [ ] Error handling (swallowed exceptions, generic catches)
- [ ] Resource leaks (unclosed connections, file handles, streams)
- [ ] Race conditions and thread safety
- [ ] Input validation at system boundaries
- [ ] Proper use of types (no unnecessary `any`)
- [ ] Consistent error response format

### Dependencies
- Run `npm audit` or equivalent if available
- Check for outdated major versions
- Flag dependencies with known CVEs

## Output Format

```
## Audit Report

### Risk Level: [LOW | MEDIUM | HIGH | CRITICAL]

### Critical Findings
1. **[Title]** — `file:line`
   - Issue: ...
   - Impact: ...
   - Fix: ...

### Warnings
1. ...

### Recommendations
1. ...

### Clean Areas
- [Note what looks good]
```

Prioritize findings by risk. Be specific with file paths and line numbers.
