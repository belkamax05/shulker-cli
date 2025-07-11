import { Agent, run } from '@openai/agents';

const agent = new Agent({
  name: 'Assistant',
  instructions: 'You are a helpful assistant',
});

// const prompt = 'Write a haiku about recursion in programming.'
const prompt = process.argv[2] || 'Write a haiku about recursion in programming.';

console.log(`Q: ${prompt}`);
console.log('A:');

run(agent, prompt).then((result) =>
  console.log(result.finalOutput),
);
