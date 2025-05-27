# Building a Tactical RPG in Godot
*Day 1 of the Insigne Ignis Development Blog*

I've been coding professionally for over a decade, built everything from enterprise microservices to SaaS platforms, and there's still one itch I haven't scratched properly: **making my own full-fledged video game!** Today, that changes!

Sure, I've put together several small single-level games (and sometimes, 2 or 3 levels, even!), and run through a dozen or so tutorials, courses, and even pushed a few to friends and family. But I've never *launched* a game. Specifically, this time around, a turn-based Fire Emblem, Final Fantasy Tactics/Tactics Ogre, and Suikoden inspired RPG.  Also, *still no shame* about starting up yet another project while [editly](https://editly.io) and [upoll](https://upoll.live) sit there giving me guilt trips from my GitHub repos.

## The Vision: Fire Emblem Meets FFT/Tactics Ogre Meets Suikoden Meets Camelot

I absolutely LOVE the Fire Emblem series of games, that entire style of turn-based RPG being reminiscent to the Game of Kings, Chess, while allowing you to actually improve and grow your pieces, to get to "know" them beyond basic roles while still laser focusing on their inherent value in battle, their struggle and meaning put to the "game" rather than just a simple win or loss. And I've always loved Suikoden, the recruiting of characters, which the FE series shared, and the base building which the FE series eventually sort of included but not quite in the same way (and nowhere near as satisfyingly). Plus the story in some of the FE games, Suikoden 2 and 5 were excellent, as in Final Fantasy Tactics and Tactics Ogre. And FFT's/TO's 2.5D isometric views and challenges that elevation presented, which was also present in the later FE games, I mean, who could forget how that impacted the challenge, the combat, the cutscenes? And finally, I'm a huge fan of Arthurian lore, so I had the premise and background for the story already sort of baked in, even if I "hide it" from the players during the short introduction with nicknames for the three main characters.

Enter **Insigne Ignis** – my attempt to build the tactical RPG I've always wanted to play, with the ability to write a story in the realm of Arthurian legends. 

The elevator pitch? *Fire Emblem's tactical combat meets  Suikoden's base building and FFT/Tactics Ogre's meaningful choices, wrapped in a world where your decisions echo through three parallel storylines.* Ambitious? Absolutely. Achievable by one developer with a full-time job and a consulting business? We're about to find out, aren't we?

## Why Godot Over Unity (Or That Other One)

**"But Ahad, you literally have Unity experience! You've shipped projects in Unity!"**

Right? And that's exactly why I'm using Godot 4.4.1 instead (*trust me on this one!*), despite prior experience. Plus, it's always fun to learn and do something new, and I've been meaning to get around to Godot for a while since I'd already worked with the other two "major" engines.

Here's the thing about Unity in 2025 – it's become the enterprise Java of game engines. Powerful? Sure. But also bloated, fee-structure-changing, and honestly? I'm tired of waiting 45 seconds for the editor to recompile because I changed a variable name. Plus, after their whole pricing fiasco (you know the one), I'd rather bet on open source. And the thing about Unreal, while it's open source, it's C++ and I wrote that waaaaay back when I was at UTA and a couple semesters of intership work at Lockheed Martin and L-3. It's been nearly a couple decades, best for me to stick with C# if I can't just use Ruby, y'know?

### The Real Reasons I Chose Godot:

1. **C# Support That Actually Works** – Godot 4.x finally has first-class C# support. As someone who's been writing C# since .NET Framework 1.1 (showing my age here), this matters. I can leverage a decade of muscle memory instead of learning GDScript. Especially since GDScript seems pretty shitty (as any and all indentation-based languages do, not gonna lie).

2. **2D/2.5D Is Where It Shines** – Unity is overkill for what I'm building. Godot's 2D renderer is pretty perfect for isometric tactical games. Less overhead, better performance, theoretically happier developer.

3. **The Editor Doesn't Make Me Want to Throw My Laptop** – Starts in under 3 seconds. Hot reload that actually works. Scene system that makes sense. It's like they asked actual developers what they wanted. Novel concept, right?

4. **No Vendor Lock-in BS** – My code is my code. My assets are my assets. If Godot somehow implodes tomorrow (it won't), I can fork it and continue. Try doing that with Unity or Unreal.

5. **The Community Is Great** – Spent a week lurking in the Godot Discord, trawling through various online forums and communities, and asking questions from folks who are in some of my other gaming discords that work with Unity and Unreal. People actually help each other instead of posting "RTFM" to every question. Refreshing.

## Today's Actual Development: Setting Up Shop

Enough philosophy – let's talk about what I actually built today. *Spoiler alert*: It's mostly boring setup stuff, but that's any kind of software dev for you.

### Repository Structure

First things first, I created a Git repository with a structure tied to future work with collaborators:

```
InsigneIgnis/
├── godot/              # The actual Godot project
│   ├── assets/         # Raw assets (keeping source files)
│   ├── scenes/         # Godot scenes, organized by feature
│   ├── scripts/        # C# scripts, following domain structure
│   ├── resources/      # Godot resources (materials, themes, etc.)
│   └── addons/         # For when I inevitably need plugins
├── docs/               # Design docs, because even though I used to think documentation is a necessary evil, it's become one of my core requirements
├── tools/              # Build scripts, asset pipeline stuff
└── marketing/          # Screenshots, GIFs, elevator pitches
```

**Why this structure?** Because I've learned the hard way that "I'll organize it later" is a lie we tell ourselves. Just like "I'll add tests later" or "this prototype code is just temporary. No, if it's throwaway code, I don't even publish it anymore, if it needs tests to validate it, I'll write them right away, and when it comes to organization, it's far better to be prescriptive and commit to it.

### Godot Project Settings That Matter

Created the project with these non-negotiable settings:

- **Renderer**: Forward+ because Metal/Vulkan performance on modern hardware is *nice*
- **Default Texture Filter**: Nearest, because pixel art needs to stay crispy
- **Version Control**: Enabled with .gitignore that actually ignores the right things
- **C# Solution**: Generated and added to version control

### The First Commit: A README That Sets Expectations

```markdown
# Insigne Ignis

A tactical RPG where your choices matter, your units stay dead, and the support 
conversations don't make you reach for the skip button.

## Current Status: Day 1 of ???
- [x] Project exists
- [x] Repository has structure  
- [ ] Literally everything else

## Dev Blog
Following along? Check the daily posts at [ahad.dev/entries](http://ahad.dev/entries)

## Running This Thing
1. Install Godot 4.4.1 with C# support
2. Open the project
3. Marvel at the empty scenes
4. Check back tomorrow when there's actual content
```

Is it much? No. But it's honest, sets expectations, and most importantly – **it exists**. That's more than the dozen game ideas sitting in my brain have achieved.

## What's Next: The Reality Check

Tomorrow I'm diving into the asset pipeline. Found some decent isometric sprite packs on itch.io that won't make my eyes bleed (hopefully). The goal is to get basic terrain rendering working by end of week. Will I achieve it? *Probably not*, but that's what makes this journey fun, right?

Here's what I learned today:
- Starting is harder than planning (shocking, I know!)
- Godot's documentation is actually readable, unlike some *other* engines
- Public accountability via daily blogging means I actually have to show progress
- My commit message "Initial commit - let's gooooo" probably needs work

## The Call to Action (Because Every Blog Post Needs One)

Are you building something? Thinking about building something? Still debating between engines like I was last week? Here's my advice: **pick one and start**. The perfect engine doesn't exist. The perfect time doesn't exist. But your game idea? That deserves to exist.

Follow along as I stumble through building Insigne Ignis. I promise honest updates, actual code, and probably way too many parenthetical asides. Tomorrow: "The Great Asset Hunt: Building a 2.5D Tactical RPG on a Budget" (spoiler: the budget is basically nothing).

I'd say drop a comment if you're also building a game – misery loves company, and game dev is nothing if not glorious misery. Except, you know, I don't have a comment system because I don't need or want any commentary from the peanut gallery. So what's the call to action for, you ask? For you to shoot me your email if you're interested in the game! You can figure out how to reach me in a way that makes you comfortable: [about.me/ahad.amdani](https://about.me/ahad.amdani)

*Now if you'll excuse me, I need to go stare at my empty Godot project and contemplate what I've gotten myself into.*

---

**Day 1 Stats:**
- Lines of Code: 0 (unless you count the .gitignore)
- Coffee Consumed: 2 bottles of Starbucks Mocha Latte.
- Times I Questioned This Decision: 4
- Assets Purchased: 0 (tomorrow's problem)
- Enthusiasm Level: 11/10

*Find me on [Twitter](https://twitter.com/ahadamdani) where I'll probably not be posting much at all, especially not daily screenshots of my "progress" (today's screenshot would've literally been an empty Godot window). But hey, if you follow me, maybe some day I'll drop something interesting!*