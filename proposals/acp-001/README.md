---
title:  'ACP-001: Introducing ACPs'
---

## Authors

Samuel Evans-Powell, with significant help from Jonathan Knowles and Heinrich Apfelmus.

## Status

`PROPOSED`{.lightyellow}

## Abstract

This document outlines a process which enables team members to propose and sustain positive change within the company in an *asynchronous*, *persistent*, and *fair* manner.

Fair because we recognize that Adrestia is a team of talented individuals acting in good faith towards one another, and so, our varying perspectives carry valuable information.

Persistent because we want discussions around important topics captured for posterity, and any positive changes we make to be sustained indefinitely (or until a future proposal takes it's place).

Asynchronous because we work in different timezones, and asynchronous communication is one of the best ways to fairly capture the views of every individual, while respecting their working hours and work-life balance.

## Introduction

### Change and Posterity

As a self-managed team, we are responsible for ensuring that we operate effectively.
To do this, we need to be able to institute processes that allow us to work in an efficient manner, and when we see issues, we need to be able to suggest new processes and make decisions that address them.

If an individual (inside or outside the team) wanted to see what our current processes are, or suggest a new change, where would they do that?
Existing processes might be documented in the Adrestia wiki, a Slack conversation might detail our approach (or was it in Element?), perhaps a manager documented our Sprint process in Confluence? Was the change suggested in a HedgeDoc? Or was it a Google Doc?

The stored knowledge of our processes and decisions is *highly fragmented*.
We lack a source of truth we ourselves can refer to, and importantly, can refer others outside the team to.
We can have no faith that any process we document will be followed or even viewed by other team members.

### Collaboration

Between two individuals, phone calls and frequent short messages are sufficient to reach shared goals and arrive at design decisions.
Within a team of many, living in different timezones, it becomes more difficult to communicate in this manner.

Up to this point, the primary method of collaboration we have used for more than two people has been video calls.
Video calls are a great place to informally share ideas, but lack persistence, and cannot accomodate more than one or two ideas per meeting.
They are also not a good place for fair discussion, with social dynamics dictating that one or two voices dominate the discourse, and individual availability affecting representation of opinions.

### Problem statement

The Adrestia team lacks a trusted point-of-reference for their processes and decisions, and has no defined process for proposing new ideas and creating change.
Existing ways of discussing and debating change are unfair, and the results of those discussions are not recorded anywhere.

The goal is to provide a way for team members to propose and discuss change in an asynchronous and fair manner, and persist the results of those discussions.
The process should be low-friction and trustworthy, inspiring team members to initiate and sustain the change they want to see, improving the effectiveness of the team in the long run.

## Proposed solution

Use lightweight documents committed to a central Git repository (inspired by the RFC process found in many open-source projects) to propose, discuss, and document all design decisions, process changes, and existing processes.

Each document is a proposal for some sort of change within the team, and is known as an "Adrestia Change Proposal" (ACP).
This document is the first ACP.

ACPs are meant to be informal and accessible, not academic or formal specifications.
They should be fun to read, not boring.
Even if a reader doesn't understand all the technical and business aspects of an ACP, they should be able to get a general sense of it's value from reading the abstract.

It's up to the team to decide on the level of detail required for each RFC.
If lengthy detailed discussion of a topic is needed, it can be included, or peers giving feedback can request it.

The scope of RFCs extends across any decision which requires the "buy-in" of many individuals to support.
We do not want to weigh the team down with heavy processes, if you see something broken, fix it, don't feel a need to submit an RFC.
Submit an RFC if you want to make positive change that you cannot take full responsibility for, or which affects the entire team.

RFCs should be loosely based on the following structure:

- Author(s)
  - include contact information
- Status, one of:
  - `PROPOSED`{.lightyellow}
  - `REJECTED`{.lightred}
  - `ACCEPTED`{.lightgreen}
- Abstract
  - A few paragraphs describing the RFC at a high level
- Introduction
  - Context
  - Problem statement
  - Goals and non-goals
- Proposed solution
  - Implementation
    - How it works
    - Pros and cons
  - Impact, for example on:
    - End users
    - Our team
    - Costs
    - Performance
    - Security
  - Quality assurance
    - Testing
    - Operational concerns
      - Deployment
      - Monitoring
- Alternatives
  - Alternative implementations, also including:
    - Implementation details
    - Pros and cons

Items in the structure above that are not applicable can be excluded.
Graphics, drawings, links, references, and whatever else helps convey your design may be included.

Proposals that supercede a previous proposal should include all relevant parts of the old proposal, so that readers don't have to "walk the tree" to determine the current state of things.

### Submitting a proposal

To submit a proposal, clone the [repository](https://github.com/input-output-hk/acp), create a branch for your proposal, and then write your proposal in a new file in the appropriate place.

Submit a pull request to the repository from your branch to the master branch.

An automated bot will build a pretty website page from your proposal and provide a link to it.

Assign yourself to the PR and assign every team member as a reviewer. This includes developers, managers, project managers, scrum master, and any other interested party.

Detailed instructions exist in the README of the [repository](https://github.com/input-output-hk/acp).

### Discussing a proposal

All discussion of a proposal should occur in the website version of the proposal, which has tools for annotation à la Google Docs.

For a proposal to be accepted, every team member must accept it.
This includes developers, managers, and project managers.
A proposal cannot move into the accepted state by any other means.

This means each reviewer has the power to veto any decision - please use that power responsibly.
Practice empathy, see and understand the issue the proposer is trying to address, and move towards a shared understanding.
Explain your reasoning clearly, use logic, avoid emotional arguments, and make every effort to understand and sufficiently answer questions asked of you.
Do not use unqualified assertions designed to shut down discussion ("X is better!").
Understand also that technical decisions have social and emotional implications, and those must be considered too - technology is not neutral and a technically superior solution does not necessarily mean a better solution.
Sharing Excel spreadsheets over email might be the best solution in some contexts, despite it's technical shortcomings.

Act in good faith.

Your approval indicates that you have read the proposal, understood it's impact on you, and accepted any additional responsibilites it burdens you with.

### Impact

Team members and their interactions with the rest of the company are bound by each and every accepted proposal.
They are explicitly not bound to perform in any manner not captured in an accepted proposal (within reason - we are all contractually bound to the company in one way or another, are required to act within the realms of common decency, and existing committments may force us to act outside of these proposals).
We should aim to capture existing commitments in a proposal, or re-negotiate our existing commitments to match the proposals.

If an external team or individual is not satisfied, they may themselves submit a proposal, which is why it's important this process be open to the world - in allowing others to have a say, we define our interface with the rest of the company.

Ultimately, the proposal would need to be accepted by each of us, which means we know that every team member has read the proposal and is aware of their responsibilities with respect to it.

#### Benefits

- We'll have a singular point of reference for our processes.

- The process organically forms consensus and buy-in. Having everyone involved in a decision is a good way to naturally get "buy-in" for a solution. The willingness of individuals to take responsibility for their part in maintaining a decision or process is more important than the quality of the decision or process itself.

- We'll have a log of the decisions and trade-offs we've made during the project. This is a great start for new team members to read about the team and understand it's history and current situation.

- Designing together and getting feedback from team members with other perspectives in a fair manner will produce better designs. It will spread knowledge more efficiently, and enable us to work remotely and to respond when time permits.

- The process is open to the entire world, to form both a guidebook on how we work, to define our interface with outsiders, and to allow others to have a say in our processes.

- Having our processes documented in a public and discoverable place:
  - Is an advertisement to future team members.
  - Allows outsiders to have a say in our processes - this could be powerful (for example, in helping us collaboratively define our team-company interface - how the company requests work from us etc.).

- If the process is successful, team members will feel they have a greater sense of agency, and feel they can resolve issues they face.

#### Risks

##### Buy-in

If the ACP process does not lead to organic buy-in, then we could end up with a bunch of processes that no-one does, and yet another source of fragmentation.

##### Fragmentation

How does suggesting a new place to store our proposals not simply *further* fragment our knowledge base?

![](https://imgs.xkcd.com/comics/standards.png)

Put simply, because everyone "buys into" this solution.
Rather than just "doing something" and hoping to get people interested (which results in some people doing the process, some people not, and some people completely unaware), this process requires the explicit acknowledgement from every individual in the team before the proposal can move forward.
Each team member is made aware of the process and their responsibility.

Additionally, we work to retro-actively document existing processes into change proposals, thereby reducing fragmentation.

##### Existing tools

Documentation not suitable for an ACP may still be documented in external tools (e.g. the wiki).
Any information in an external tool that is covered by an ACP should be removed, and a link to the relevant ACP inserted.
Keep in mind that according to this proposal, any process kept in any other document is non-binding.
These proposals form the "Bible" for our team.

## Alternatives

The following could be alternative venues on which we discuss and reach decisions:

### Instant message (Slack, Matrix, etc.)

This is a very low-friction communication choice, allowing everyone to contribute to discussion in an easy and asynchronous manner. However, it lacks:

  - Good persistence: conversations are quickly lost among the deluge.
  - True asynchronous communication: the platform may be asynchronous, but because conversations are quickly lost, your timezone dictates how involved in a conversation you can be. You may entirely miss conversations that happened overnight.
  - No explicit approval mechanism: There is no explicit way to reach consensus.

### Email

Email is the "lowest common denominator" for communication in the company. Everyone uses email, and as such it is a good place for discussion with those outside the company. However, email lacks:

  - Good persistence: Emails are easily lost amongst the many other emails we each receive.
  - Readability: Long email chains are difficult to read, especially involving multiple people.
  - No explicit approval mechanism: Same as instant messaging.

### Meetings

Meetings are certainly useful in some contexts, especially for complex discussions.
However, they should not be our primary way of communication.
Meetings require time synchronization (or co-location), are generally a bad format for fair discussion (as mentioned previously), and have no fair, explicit way of reaching consensus.
Additionally, discussions aren't recorded for future reference, or if they are, not in a format suitable for quick reference.

## Credit

Much of the structure of this document was derived from Oskar Wickström's [RFC template](https://wickstrom.tech/assets/meta.rfc.pdf) and [associated post](https://wickstrom.tech/general/2020/03/13/my-experience-in-working-remotely.html).
