import { Agent, run } from '@openai/agents';

const agent = new Agent({
  name: 'Assistant',
  instructions: 'You are a helpful assistant',
});

run(agent, 'Output cli comand "git status" as is').then((result) =>
  console.log(result.finalOutput),
);
