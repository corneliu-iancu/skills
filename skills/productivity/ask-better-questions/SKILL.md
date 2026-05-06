---
name: ask-better-questions
description: Refine questions and problems through 7 Socratic lenses to improve thinking, AI interactions, and decision-making. Use this skill when the user wants to ask better questions, refine a question, think through a problem from multiple angles, explore an idea, challenge their thinking, apply Socratic questioning, use the 7 lenses framework, stress-test a decision, or generally improve the quality of a question before asking it. Also use when the user seems stuck on a decision or is asking a surface-level question that would benefit from deeper exploration.
---

# Ask better questions

Transform shallow questions into powerful ones by running them through 7 Socratic lenses.

## Quick start

Take the user's question or problem and apply the **7 lenses**:

1. **Challenge** — What's wrong with my reasoning?
2. **Unconstrained** — What if I had infinite resources?
3. **Meta** — What didn't I ask?
4. **Uncertainty** — Where am I wrong?
5. **Inverse** — What's the opposite?
6. **Reframe** — How would a [domain expert] see this?
7. **Assumptions** — What am I optimizing for implicitly?

**Example:**

User's question: *"How do I build better retention?"*

**After 7 lenses:**
- *"What flaws are in my retention model?"*
- *"What if I had unlimited budget to keep users?"*
- *"What signals am I ignoring that predict churn?"*
- *"Where's my retention strategy failing that I haven't admitted?"*
- *"How would I maximize churn instead?"*
- *"How would a behavioral psychologist reframe retention?"*
- *"Am I optimizing for retention or engagement?"*

Pick 1-2 that resonate. Ask those instead. Get better answers.

## How to use

### Approach 1: AI-guided (interactive) — default

1. User gives their problem: *"I'm trying to..."*
2. Apply all 7 lenses and present reformulations
3. User picks which ones matter
4. Explore the chosen lenses deeper, then synthesize

### Approach 2: Self-guided (manual)

1. Present the 7 lenses as a framework
2. User applies each lens themselves
3. Help them refine the 1-3 that feel most important

### Approach 3: Deep dive (iterative)

1. Start with one lens (e.g., Inverse)
2. Explore that lens thoroughly
3. Move to the next lens
4. Synthesize across lenses for comprehensive insight

## The 7 lenses — quick reference

| Lens | Reframes | Best for |
|------|----------|----------|
| Challenge | Weaknesses in your approach | Catching blind spots |
| Unconstrained | What's truly wanted, not constrained | Vision-setting, discovering what matters |
| Meta | What you're missing | Completeness checks, edge cases |
| Uncertainty | Admitting what you don't know | Risk awareness, intellectual humility |
| Inverse | Opposite direction | Discovering root causes, hidden assumptions |
| Reframe | Fresh perspective from another field | Novel solutions, pattern recognition |
| Assumptions | What you're actually optimizing | Alignment checks, goal clarification |

For detailed guidance, prompts, and examples for each lens, read [references/lenses.md](references/lenses.md).

## When this skill helps most

- **Before asking AI anything important** — refine the prompt first
- **When stuck on a problem** — a different lens often unsticks you
- **Decision-making** — expose hidden trade-offs
- **Project planning** — catch unspoken goals
- **Learning** — go deeper than surface answers
- **Creativity** — challenge assumptions to unlock new ideas

## Common patterns

### Surface question into 3 refined questions
```
Surface: "Should I hire more engineers?"

Lens 1 (Challenge): "What are the real constraints on our output — is it headcount?"
Lens 4 (Uncertainty): "Where am I wrong about engineering capacity?"
Lens 7 (Assumptions): "Am I optimizing for velocity or code quality?"

Ask these 3 instead of the surface one.
```

### Stuck decision
```
Stuck on: "Do I pursue this project or not?"

Lens 6 (Reframe): "How would a CFO see this? A designer? A customer?"
Lens 5 (Inverse): "What if I actively avoided this? What's the fear?"
Lens 3 (Meta): "What am I not asking that would help?"

Run through these lenses first; the decision often clarifies.
```

### Brainstorming breakthrough
```
Brainstorming: "How do we improve onboarding?"

Lens 5 (Inverse): "How would we maximize onboarding failure?"
Lens 2 (Unconstrained): "What if onboarding took 10x longer but was perfect?"
Lens 6 (Reframe): "How would a game designer think about this?"

These unconventional angles unlock creative solutions.
```

## Lens combinations

**Trio for clarity:**
- Lens 7 (Assumptions) + Lens 3 (Meta) + Lens 1 (Challenge)

**Trio for creativity:**
- Lens 5 (Inverse) + Lens 6 (Reframe) + Lens 2 (Unconstrained)

**Trio for risk:**
- Lens 4 (Uncertainty) + Lens 5 (Inverse) + Lens 3 (Meta)

## Tips

- **Start with 1 lens**, not all 7 — too many at once overwhelms
- **Some lenses matter more than others** for any given problem — lean into the 2-3 that feel obvious
- **Iterate** — first refinement begets second refinement
- **Trust your gut** — if a lens doesn't resonate, skip it
