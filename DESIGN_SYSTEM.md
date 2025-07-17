# eShows Portal do Colaborador - Design System

## 🎨 Color Palette

### Primary Colors
- **Background**: `#1A1A1A` - Dark Graphite Premium
- **Primary**: `#FC4F22` - Vibrant Orange (eShows brand)
- **Secondary**: `#FDB03D` - Golden Yellow
- **Text Primary**: `#FFFFFF` - Pure White
- **Text on Secondary**: `#2D2D2D` - Graphite

### Extended Palette
- **Background Secondary**: `#242424` - Elevated surfaces
- **Background Tertiary**: `#2E2E2E` - Cards and modals
- **Border**: `#3A3A3A` - Subtle borders
- **Success**: `#4CAF50` - Green
- **Error**: `#F44336` - Red
- **Warning**: `#FF9800` - Orange
- **Info**: `#2196F3` - Blue

### Opacity Variants
- **Text Disabled**: `rgba(255, 255, 255, 0.5)`
- **Text Secondary**: `rgba(255, 255, 255, 0.7)`
- **Overlay**: `rgba(0, 0, 0, 0.5)`

## 📐 Typography

### Font Family
```css
--font-primary: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-mono: 'JetBrains Mono', 'Consolas', monospace;
```

### Font Sizes
```css
--text-xs: 0.75rem;    /* 12px */
--text-sm: 0.875rem;   /* 14px */
--text-base: 1rem;     /* 16px */
--text-lg: 1.125rem;   /* 18px */
--text-xl: 1.25rem;    /* 20px */
--text-2xl: 1.5rem;    /* 24px */
--text-3xl: 1.875rem;  /* 30px */
--text-4xl: 2.25rem;   /* 36px */
--text-5xl: 3rem;      /* 48px */
```

### Font Weights
```css
--font-light: 300;
--font-regular: 400;
--font-medium: 500;
--font-semibold: 600;
--font-bold: 700;
```

### Line Heights
```css
--leading-tight: 1.25;
--leading-normal: 1.5;
--leading-relaxed: 1.75;
```

## 📏 Spacing System

Based on 8px grid:
```css
--space-1: 0.25rem;   /* 4px */
--space-2: 0.5rem;    /* 8px */
--space-3: 0.75rem;   /* 12px */
--space-4: 1rem;      /* 16px */
--space-5: 1.25rem;   /* 20px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */
--space-10: 2.5rem;   /* 40px */
--space-12: 3rem;     /* 48px */
--space-16: 4rem;     /* 64px */
--space-20: 5rem;     /* 80px */
--space-24: 6rem;     /* 96px */
```

## 🎭 Shadows & Elevation

```css
--shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.3);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.3);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.3);
--shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.3);
--shadow-2xl: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
--shadow-glow: 0 0 20px rgba(252, 79, 34, 0.3);
```

## 🔄 Border Radius

```css
--radius-none: 0;
--radius-sm: 0.125rem;   /* 2px */
--radius-md: 0.375rem;   /* 6px */
--radius-lg: 0.5rem;     /* 8px */
--radius-xl: 0.75rem;    /* 12px */
--radius-2xl: 1rem;      /* 16px */
--radius-full: 9999px;
```

## 🎯 Brand Voice & Personality

### Tone of Voice
- **Professional**: Comunicação clara e objetiva
- **Moderna**: Linguagem atualizada e dinâmica
- **Acolhedora**: Tom amigável e inclusivo
- **Eficiente**: Direto ao ponto, sem rodeios

### Princípios de Comunicação
1. **Clareza**: Mensagens simples e compreensíveis
2. **Consistência**: Padrões uniformes em toda a plataforma
3. **Empatia**: Consideração pelas necessidades do colaborador
4. **Ação**: Foco em resultados e produtividade

### Exemplos de Mensagens

#### Boas-vindas
- ✅ "Olá, João! Bem-vindo ao Portal do Colaborador"
- ❌ "Usuário logado com sucesso no sistema"

#### Erros
- ✅ "Ops! Não conseguimos processar sua solicitação. Tente novamente"
- ❌ "Erro 500: Internal Server Error"

#### Confirmações
- ✅ "Tudo certo! Suas férias foram solicitadas"
- ❌ "Requisição #12345 cadastrada"

## 🧩 Component Tokens

### Buttons
```css
--btn-height-sm: 32px;
--btn-height-md: 40px;
--btn-height-lg: 48px;
--btn-padding-x: var(--space-4);
--btn-radius: var(--radius-lg);
```

### Cards
```css
--card-bg: var(--bg-tertiary);
--card-padding: var(--space-6);
--card-radius: var(--radius-xl);
--card-shadow: var(--shadow-md);
```

### Forms
```css
--input-height: 40px;
--input-padding-x: var(--space-3);
--input-bg: var(--bg-secondary);
--input-border: var(--border-color);
--input-radius: var(--radius-md);
```

### Navigation
```css
--nav-height: 64px;
--sidebar-width: 280px;
--sidebar-collapsed-width: 80px;
```

## 🎨 CSS Variables Implementation

```css
:root {
  /* Colors */
  --color-bg-primary: #1A1A1A;
  --color-bg-secondary: #242424;
  --color-bg-tertiary: #2E2E2E;
  --color-primary: #FC4F22;
  --color-secondary: #FDB03D;
  --color-text-primary: #FFFFFF;
  --color-text-on-secondary: #2D2D2D;
  
  /* Apply to elements */
  --bg-primary: var(--color-bg-primary);
  --bg-secondary: var(--color-bg-secondary);
  --bg-tertiary: var(--color-bg-tertiary);
  --border-color: #3A3A3A;
}
```

## 📱 Responsive Breakpoints

```css
--screen-sm: 640px;   /* Mobile landscape */
--screen-md: 768px;   /* Tablet */
--screen-lg: 1024px;  /* Desktop */
--screen-xl: 1280px;  /* Large desktop */
--screen-2xl: 1536px; /* Extra large */
```

## ⚡ Animation & Transitions

```css
--transition-fast: 150ms ease-in-out;
--transition-base: 200ms ease-in-out;
--transition-slow: 300ms ease-in-out;
--transition-transform: transform 200ms cubic-bezier(0.4, 0, 0.2, 1);
```

## 🎯 Accessibility Guidelines

- Contrast ratio mínimo de 4.5:1 para texto normal
- Contrast ratio mínimo de 3:1 para texto grande
- Foco visível em todos os elementos interativos
- Suporte completo para navegação por teclado
- ARIA labels descritivos em componentes complexos

## 📚 Interactive Brandbook

### Accessing the Brandbook
Visit `/brandbook` in your local development environment to access the interactive design system documentation.

### Brandbook Features
- **Live Component Gallery**: Interactive examples of all UI components
- **Color Palette Explorer**: Click-to-copy color values with usage guidelines
- **Typography Showcase**: Complete font scale with examples
- **Interactive Playground**: Customize design tokens in real-time
- **Responsive Templates**: View all 4 page templates (Dashboard, Form, List, Detail)

### Page Templates Available
1. **Dashboard** (`/templates/dashboard`): Main portal homepage with widgets
2. **Form** (`/templates/form`): Multi-step form wizard example
3. **List** (`/templates/list`): Data table with pagination and filters
4. **Detail** (`/templates/detail`): Comprehensive detail view layout

### Navigation Components
- **Sidebar**: Collapsible navigation with nested menu support
- **Breadcrumb**: Path navigation with home icon
- **PageHeader**: Consistent page headers with actions