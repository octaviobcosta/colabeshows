
# 🏛️ SUPREME LAW OF THE PROJECT — eShows **Supplier Portal**

> “Order is Heaven’s first law.” – Alexander Pope  

**Effective Date:** 2025-01-15  
**Status:** IN FORCE & UNBREAKABLE  

This file is the **CONSTITUTION** of the project. Every technical decision, implementation, and process **must** comply with these laws. Violations lead to immediate code reversal.

---

## 📊 AUTHORITY HIERARCHY

| Rank | Document | Notes |
|------|----------|-------|
| 1 | **PROJECT_LAW.md** (this file) | **SUPREME LAW** |
| 2 | `DESIGN_SYSTEM.md` | Unified visual system  *to be created* |
| 3 | `COMPONENT_REGISTRY.md` | Living registry of components |
| 4 | `API_CONTRACTS.md` | Interface contracts |
| 5 | `/docs/` | Historical records |

---

## 🎯 FUNDAMENTAL PRINCIPLES (NON-NEGOTIABLE)

1. **Security Is Non-Negotiable**  
   • LGPD compliance by design  
   • Zero-trust architecture  
   • Sensitive data is always encrypted  

2. **Performance Is Sacred**  
   • Core Web Vitals > 90  
   • Zero bloat, zero waste  
   • Every kilobyte matters  

3. **Maintainability Over Speed**  
   • Clean code > fast delivery  
   • Documentation > human memory  
   • Tests > blind trust  

4. **Consistency Is Law**  
   • One standard for the whole team  
   • Design System is the bible  
   • Exceptions require a vote  

---

## 📜 CHAPTER I — ARCHITECTURE LAWS

### **Article 1 — Project Structure (Unbreakable)**

```

portal-suppliers-eshows/
├── Laws/                     # Project laws
│   ├── PROJECT\_LAW\.md        # ← this file
│   └── DESIGN\_SYSTEM.md      # Design system (TBD)
├── docs/                     # Categorised documentation
│   ├── architecture/         # Architectural decisions
│   ├── api/                  # API docs
│   ├── components/           # Component guides
│   └── processes/            # Processes & workflows
├── src/
│   ├── app/                  # Next.js 14 App Router
│   │   ├── (auth)/           # Auth group
│   │   ├── (dashboard)/      # Dashboard group
│   │   ├── (public)/         # Public pages
│   │   └── api/              # API routes
│   ├── components/
│   │   ├── ui/               # Base shadcn components
│   │   ├── features/         # Feature components
│   │   └── layouts/          # Layout components
│   ├── lib/                  # Libraries & utilities
│   │   ├── supabase/         # Supabase client
│   │   ├── validations/      # Zod schemas
│   │   └── utils/            # Helper functions
│   ├── hooks/                # Custom hooks
│   ├── services/             # Business logic
│   ├── stores/               # Zustand global state
│   └── types/                # Type definitions
├── public/                   # Static assets
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
└── supabase/
├── migrations/
├── functions/
└── seed.sql

````

### **Article 2 — TypeScript / Next.js Standards**

#### §1 Total Type Safety

```ts
// ❌ FORBIDDEN
const handleSubmit = (data: any) => {/* ... */}

// ✅ REQUIRED
import { z } from 'zod';

const userSchema = z.object({
  name: z.string().min(1),
  email: z.string().email(),
  role: z.enum(['supplier', 'manager', 'director', 'admin']),
});

type User = z.infer<typeof userSchema>;

const handleSubmit = (data: User) => {/* ... */}
````

#### §2 Server Components First

```ts
// ❌ FORBIDDEN – unnecessary client component
'use client';
export default function UserList() {/* client fetch */}

// ✅ REQUIRED – server component
export default async function UserList() {
  const users = await getUsersFromSupabase();
  return <UserTable users={users} />;
}
```

#### §3 Standard Hooks

```ts
// ✅ Query pattern
export function useUsers() {
  return useQuery({
    queryKey: ['users'],
    queryFn: fetchUsers,
    staleTime: 5 * 60 * 1000,
  });
}

// ✅ Mutation pattern
export function useCreateUser() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: createUser,
    onSuccess: () => qc.invalidateQueries(['users']),
  });
}
```

### **Article 3 — Supabase Standards**

#### §1 RLS Mandatory

```sql
-- ❌ FORBIDDEN – table without RLS
CREATE TABLE documents (...);

-- ✅ REQUIRED
CREATE TABLE documents (...);
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users view own docs"
  ON documents FOR SELECT USING (user_id = auth.uid());
```

#### §2 Generated Types

```bash
# Run after schema changes
npm run supabase:types
```

```ts
import { Database } from '@/types/supabase';
type Profile = Database['public']['Tables']['profiles']['Row'];
```

### **Article 4 — Commits & Versioning**

#### §1 Conventional Commits

```bash
<type>(<scope>): <subject>

# Examples
feat(auth): add magic-link login
fix(profile): correct document upload
docs(readme): update setup instructions
```

#### §2 Branch Strategy

```
main          # production
└─ develop    # integration
   ├─ feat/<feature-name>
   ├─ fix/<bug-description>
   └─ refactor/<area>
```

---

## 🎨 CHAPTER II — UI/UX LAWS

### **Article 5 — Design System**

#### Law 1 Design Tokens *(to be defined in Phase 0)*

```css
:root {
  --color-primary: [TBD];
  --spacing-1: [TBD];
  --font-sans:   [TBD];
  /* …etc. */
}
```

#### Law 2 shadcn/ui Components

```ts
// ✅ ALWAYS use shadcn base components
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
```

#### Law 3 Mobile-First Responsiveness

```css
/* Mobile base */
.container { /* mobile spacing */ }

/* Tablet */
@media (min-width: [TABLET_BP]) { /* … */ }

/* Desktop */
@media (min-width: [DESKTOP_BP]) { /* … */ }
```

#### Law 4 Accessibility — WCAG AA

* Minimum contrast 4.5:1
* Focus visible for all interactive elements
* ARIA labels mandatory
* Full keyboard navigation

### **Article 6 — Front-end Performance**

#### §1 Bundle Size Control

```ts
// ❌ FORBIDDEN
import _ from 'lodash';

// ✅ REQUIRED
import debounce from 'lodash/debounce';
```

#### §2 Image Optimization

```tsx
import Image from 'next/image';

<Image
  src="/avatar.jpg"
  alt="User avatar"
  width={40}
  height={40}
  loading="lazy"
/>
```

---

## 🔒 CHAPTER III — SECURITY LAWS

### **Article 7 — Auth & Authorization**

#### §1 Protection Middleware

```ts
export async function middleware(req: NextRequest) {
  const session = await getSession();
  if (!session && req.nextUrl.pathname.startsWith('/dashboard')) {
    return NextResponse.redirect(new URL('/login', req.url));
  }
}
```

#### §2 RBAC Enforcement

```ts
if (!hasPermission(user, 'documents:edit')) {
  throw new ForbiddenError('No permission to edit');
}
```

### **Article 8 — LGPD Compliance**

#### §1 Consent Registry

```ts
interface Consent {
  userId: string;
  type: 'cookies' | 'data_processing' | 'marketing';
  granted: boolean;
  timestamp: Date;
  ip: string;
}
```

#### §2 Data Subject Rights

* `GET /api/user/data` — export data
* `DELETE /api/user/data` — right to be forgotten
* Access logs retained for 6 months

---

## 📊 CHAPTER IV — TEST & QUALITY

### **Article 9 — Test Coverage**

| Layer       | Minimum          |
| ----------- | ---------------- |
| Unit        | ≥ 80 %           |
| Integration | Critical flows   |
| E2E         | Main happy paths |

### **Article 10 — CI/CD Pipeline**

Pre-merge checks **must pass**:

* `lint` (ESLint + Prettier)
* `typecheck` (`tsc --noEmit`)
* `test` (Jest)
* `build` (`next build`)
* `lighthouse` (score > 90)

---

## 🚫 CHAPTER V — ABSOLUTE PROHIBITIONS

* `console.log` in production → use a logger
* `any` types → define proper types
* `// @ts-ignore` → fix the issue
* Inline CSS → use Tailwind classes
* `useState` for every call → prefer react-query
* Secrets in code → use env vars
* Direct SQL → use Supabase client
* Components > 200 lines → refactor
* Copy–paste code → extract utils
* Skipping tests → fix tests

---

## ✅ COMPLIANCE CHECKLIST

1. **Design Foundation** complete (colors, fonts, tokens, prototype)
2. Folder structure matches **Article 1**
3. Security: RLS, encryption, RBAC, LGPD
4. TypeScript: no `any`, Zod schemas, error boundaries
5. UI/UX: Design System, responsive, WCAG, loading & error states
6. Tests: coverage & key flows green
7. Performance: Lighthouse > 90, optimized bundle/images
8. Docs: README, components, APIs, CHANGELOG up to date
9. Git: conventional commits, branch strategy, reviewed PRs
10. Deploy: env vars, migrations run, monitoring active

---

## 📋 PENDING TASKS **before coding starts**

* **Create `DESIGN_SYSTEM.md`** with final colors, typography, grid, base components, interaction patterns
* **Define breakpoints:** mobile / tablet / desktop / wide
* **Choose fonts:** primary, mono, display
* **Establish full design tokens:** semantic colors, spacing scale, shadows, radii, animations

---

## 📝 SIGN-OFF & AGREEMENT

By contributing, you **fully agree** to:

* Follow all rules herein
* Run the checklist before every PR
* Report any violations found
* Uphold code excellence
* Document key decisions

> “Quality is not an act, it is a habit.” – Aristotle

---

## 🔗 VERIFICATION COMMANDS

```bash
npm run law:check      # full compliance
npm run type-check     # TypeScript types
npm run lint           # ESLint + Prettier
npm run test           # Unit & integration tests
npm run test:coverage  # Coverage report
npm run analyze        # Bundle size
npm run audit          # Security audit
```

---

## 🛡️ ENFORCEMENT

| Severity        | Action              |
| --------------- | ------------------- |
| 🟡 **Minor**    | Warning in PR       |
| 🟠 **Major**    | Merge blocked       |
| 🔴 **Critical** | Immediate reversion |

**Run `npm run law:check` before every commit!**

```
::contentReference[oaicite:0]{index=0}
```
