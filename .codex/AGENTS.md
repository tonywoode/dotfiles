## Secrets
- Do not open or read `.env`, `.env.local`, `.env.*.local`, `*.key`, `*.secrets`, `secrets/**` 

## Personal preferences

- Suggest solutions that I didn’t think about—anticipate my needs, press me for my wider goals if the implementation suggests different paths you could take
- In the domain of coding, particularly frontend-based coding, things change fast: its very easy to provide outdated code which have negative consequences: we perpetrate bad practices, introduce conflict with more up-to-date code, and lead ourselves down rabbit holes (because a later paradigm has fixed entire classes of problems we may encounter). For example we may be working on a problem of keeping different parts of a react UI up-to-date simultaneously and using React code written before React Suspense would cause these issues, but even then, React suspense was taken further with RSC and working off the server data directly, so initial React-Suspense-based answers would also be out of date. This is a compounding problem, because related-ABIs, APIs/Framworks/Libraries/Modules progress and change over time, and is why its very important to do whatever you can to ensure your knowlege of current practices is up-to-date, your knowledge of the sources of code you're using and when it was written is considered, and its important to keep, me, the user, informed however you can of WHEN the code you are using was written and what implicit paradigms the used code might assume given the time it was written. 
- When altering my code, do NOT remove any of my prior comments without telling me. If you think a comment is no longer valid or needs amendment, comment my comment with 'TODO: is this comment still valid?:'), or otherwise amend the commend so I can see the amendment in a diff. Don't just delete it. Reasoning: I do not want to set you off on a task only to later find that you removed the domain descriptions in comments that made the code understandable and usable - this rots the project over time and is a major factor in shortening the code's usable lifespan.
 - Some tools I use regularly include these: Epic Stack, TypeScript, Node.js, React-Router Framwork Mode nee Remix v2 (the web framework), SQLite, Tailwind, React (with particular interest in server components), Vite, Vitest, Playwright, Prisma ORM, and others. If I don't specify what tech to use in a prompt you can assume these
- Some prettier config I really care about, please ensure these at all times: {"semi": false, "useTabs": false, "singleQuote": true, "arrowParens": "avoid"}
- I prefer function declarations over function expressions.
- I prefer: `thing ? 'whatever' : null` over `thing && 'whatever'` (especially in JSX)
- I like descriptive TypeScript type names (no one-letter type names). I also prefer the Array generic over the bracket syntax.
- I prefer my TypeScript to leverage type inference as much as possible (so don't add return types to functions unless absolutely necessary).
- I use a MacBook Pro, I use VSCode, I use Vim emulation in VSCode, I use native ecmascript modules over nodejs require. Solutions should take these into account
- I favour avoiding dependencies when reasonable (e.g.: prefer native fetch instead of axios)
- I favour FP-based code over OO-based code, but each can be the right tool for a particular job. If you suggest OO code I will need some talking-through


## Coding Style & Naming Conventions

- Default to formatter-first: Prettier for JS/TS, Black + isort for Python,
  gofmt for Go. Check in config files so results are reproducible.
- Use kebab-case for files/folders, PascalCase for classes/components, camelCase
  for functions and variables. Keep functions small and pure; inject
  dependencies instead of relying on globals.
- Add docstrings or short comments when intent is non-obvious, especially around
  data transformations, concurrency, or external integrations.
