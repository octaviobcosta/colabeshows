@echo off
set PHASE=%1

if "%PHASE%"=="" (
    echo Uso: next-phase.bat [numero-da-fase]
    echo Exemplo: next-phase.bat 1
    exit /b 1
)

echo === Implementando Fase %PHASE% do ROADMAP ===
echo.

superclaude edit . ^
  --instructions "Implementar Fase %PHASE% do ROADMAP.md mantendo conformidade TOTAL com PROJECT_LAW.md. Consulte o checklist de conformidade antes de gerar código. Se for Fase 1, garanta que Design System (Fase 0) esteja completo primeiro." ^
  --save-conversation "logs/fase-%PHASE%-%date:~-4%%date:~3,2%%date:~0,2%.md"

echo.
echo Fase %PHASE% processada!
pause