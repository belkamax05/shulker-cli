import { Agent, run } from '@openai/agents';

const agent = new Agent({
  name: 'Assistant',
  instructions: 'You are a helpful assistant',
});

run(agent, 'Write a haiku about recursion in programming.').then((result) =>
  console.log(result.finalOutput),
);
