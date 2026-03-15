# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Doctor Pool — Tablero de Operaciones**: A single-page HTML application (in Spanish) used as an operations board for a marketing agency. It guides operators through a 9-step, 3-phase workflow to onboard new clients — from market research through strategy to deliverable production.

## Architecture

The entire app lives in one self-contained file: `doctor_pool_execution_board.html`. No build tools, no dependencies, no server — just open in a browser.

- **CSS**: Inline `<style>` block with CSS custom properties (`:root` vars) for a dark theme. Design system uses `--amber` for active/CTA, `--green` for done, `--purple` for strategy, `--blue` for research, `--red` for production.
- **HTML**: Three sections — sticky header with progress dots, a client setup form, and the 9 step cards grouped into 3 phase blocks.
- **JS**: Vanilla JavaScript at the bottom. All state is in-memory arrays (`done[]`, `open[]`). No localStorage persistence.

## Key Concepts

- **Las 7 Maletas**: The agency's proprietary market research framework (Público, Problema, Solución, Diferenciales, Testimonios, Objeciones, Garantía). Every prompt references these.
- **Triángulo Dorado**: Offer + Audience + Message triangle — derived from the 7 Maletas in Phase 1.
- **Funnel de 6 pasos**: Video script structure (Hook → Mayéutica → Storytelling → Posibilidad → Moraleja → CTA).
- **Ciclo de 4 fases FB Ads**: Campaign budget split 60/20/10/10 across Presentación, Evaluación, Conversión, Ascensión.

## Workflow Phases

- **Fase 0 (Research)**: Steps 1-3 — Chrome extraction, Claude Research, Claude Code file processing. Each generates prompts with client/niche interpolated.
- **Fase 1 (Strategy)**: Steps 4-5 — Golden Triangle definition and FB Ads campaign plan.
- **Fase 2 (Production)**: Steps 6-9 — Word report, PowerPoint deck, Next.js landing page, scripts/copy.

## How Prompts Work

`getPrompts(cliente, nicho)` returns an array of 9 prompt strings with `${c}` and `${n}` interpolated. These are displayed in monospace prompt boxes with a copy button. Each prompt is designed for a specific Claude tool (Chrome extension, Chat with Research, Claude Code, or Chat with skills like docx/pptx/frontend-design).

## Development Notes

- To test: open `doctor_pool_execution_board.html` directly in a browser.
- Fonts loaded from Google Fonts CDN (Space Mono + DM Sans).
- No state persistence — refreshing or resetting clears all progress.
- Step 3 (Claude Code) generates a file path based on client name: `/clientes/{client-name}/investigacion/`.
