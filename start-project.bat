@echo off
echo === Iniciando Portal eshows com SuperClaude ===
echo.

superclaude create . ^
  --instructions "Você é o arquiteto principal do Portal de Fornecedores eshows. INSTRUÇÕES CRÍTICAS: 1) PROJECT_LAW.md em Laws/ é a constituição inviolável do projeto. 2) Siga o ROADMAP.md começando pela Fase 0 (Design System). 3) Implemente requisitos do BRIEFING.md. 4) Crie primeiro a estrutura base conforme Artigo 1º da PROJECT_LAW. 5) Depois crie DESIGN_SYSTEM.md com tokens em branco [A DEFINIR] conforme especificado na LAW." ^
  --save-conversation "logs/inicio-projeto.md"

echo.
echo Projeto iniciado! Verifique os arquivos criados.
pause