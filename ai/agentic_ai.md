
# Agentic AI Systems

**Linear workflows**

**Autonomous AI agents or autonomous multi-agent systems**

**Role-based AI systems**

**Production orchestration systems**

**Rapid prototyping**


## Linear Workflows
Let's start with the simplest one: Linear Workflows.  Now, this type of an agentic AI system is where things progress in a step-by-step fashion. It is more predictable what's going to happen next,  and the steps follow a certain sequence.

For example, consider a customer-facing application—let's say a customer support agent. The role of this agent is: when  a user asks a question, the agent is going to take the question and search the knowledge base for relevant responses. It's then going to craft a response and send it back to the user, and maybe take an additional  action such as creating a support ticket.


**Frameworks**

* LangChain 
* LlamaIndex 

LangChain is more suited for setups where multiple steps need to be happening in a certain sequence, and LlamaIndex is highly suitable for applications that are heavy on data retrieval and indexing.  For more complex setups, you could also use LangGraph, which is also by LangChain.

## Autonomous Multi-Agent Systems
Next, we have the Autonomous Agentic AI Systems.  In these systems, you typically give AI a goal and have it figure out how to accomplish it. So in this system, it's very common to see multiple agents  collaborating together. These agents talk to each other to accomplish the common goal.

A good example of this could be an AI coding assistant. You could have a Planner Agent that plans the solution for you, a Coder Agent  that actually writes the code for you, and a Reviewer Agent that is reviewing the code, making recommendations, and helping with debugging.  These agents are constantly talking to each other in order to give the best code possible to you.

So in this kind of setup, the problem is usually open-ended, and that's the kind of problems this setup is most helpful for. 

**Frameworks**

* AutoGen 
* BabyAGI (experimental setups) 
* CrewAI (also helpful for designing systems with open-ended problems) 

## Role-Based AI Systems
Role-Based Agentic AI Systems. These are kind of similar to autonomous agentic AI systems where there are multiple agents collaborating, so it is also a multi-agent setup,  but what makes it different is that each agent within the setup has a defined role.  They are still communicating with each other to accomplish that goal, but they are operating within the confines or constraints posed by their role descriptions. They are still working together, but with clear boundaries.

A good example of this  could be a content generation agent setup. Here you could have:

A Researcher Agent that goes on the web and fetches all the material needed to write a piece of content. 

A Writer Agent that looks at all the content fetched and writes up an article (for a social media website, let's say). 

An Editor Agent that looks at the article that has been written and makes edits to it. 

Now, they have very clearly defined roles and they don't step into other agents' roles. When they do this, they have discussions, but they're strictly confined to the description given to them for their particular roles. 

**Frameworks**

* CrewAI 
* AutoGen
* ChatDev

## Production Orchestration Systems
This is when AI moves out of the experimentation phase and gets real—moving into a real-world system. These kinds of systems require deep integration with APIs,  databases, and business workflows. 

Consider the example of an AI Operations agent. This agent detects alerts, searches documentation for the alerts, runs automation scripts, and sends summaries in a real-world organizational scenario.


Agent Framework (essentially a combination of Semantic Kernel and AutoGen) 

LangGraph (works well for well-structured, multi-layered applications) 

Agent Framework is suitable both for orchestration as well as for running autonomous workflows.

## Rapid Prototyping
These types of systems are best when you need to quickly validate ideas.  It helps you build quick prototypes to see if you can bring your ideas to reality.


**Frameworks**
* Langflow 
* FlowWise 

These tools offer a graphical user interface where you can drag components onto a canvas, connect models and workflows, and quickly test out ideas before taking them into production. 

