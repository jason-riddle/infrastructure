# Infrastructure

This is my cloud infrastructure. This is a monorepo that contains code for provisioning and configuring various web services.

This repo serves as a testing ground for new projects. Before creating a new GitHub repo, I'll create a project first. Once it feels ready, I move it into a separate repo where it will exist on it's own.

The reason I do this is because when a project first begins, there are a lot of questions to answer:

- What are the responsibilities and boundaries for this project?
- Is there enough business logic that justifies this project?
- Can this project be properly tested?
- How can backwards compatibility be designed into this project? What is the minimal number of third-party dependencies required?
- Should this project interface with other projects? If so, how can low coupling and high cohesion be achieved?
- How should CICD be managed? Is it possible to do integration testing? Is it cost-effective to do so?

These questions can take months to answer. It usually involves a design changing significantly, sometimes as much as 3 or 4 times, before it feels right.

Also, as much as possible, it's important to implement good patterns. Implementing a bad pattern is much worse than copying and pasting. Once a pattern is set, there are usually other abstractions built on top, so it can take many months to remove the bad abstraction and redesign to use the correct abstraction. Because of this, there will be lots of copying and pasting in this project.

I manage the following in `src/`

- Ansible Roles and Playbooks
- Kubernetes YAML Manifest Files
- Various Terraform Projects

I have moved my terraform infrastructure to [https://github.com/jason-riddle/terraform-infrastructure][terraform-infrastructure].

I will continue to move and shuffle things around in this repo. It's in a constant work-in-progress.

[terraform-infrastructure]: https://github.com/jason-riddle/terraform-infrastructure
