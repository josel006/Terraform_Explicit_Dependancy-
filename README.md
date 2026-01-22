# Explicit Dependency in Terraform

By default, Terraform attempts to create resources in parallel whenever possible to optimize deployment time. However, there are scenarios where one resource must be created before another, even if no direct attribute reference exists between them.

In those cases, Terraform provides the depends_on argument, which allows you to define an explicit dependency.
- Note: The example below was created using Visual Studio Code with the HashiCorp Terraform extension installed to provide syntax highlighting, validation, and Terraform workflow support.

## What Is an Explicit Dependency?

An explicit dependency is created when you manually instruct Terraform to create one resource before another using the depends_on argument.

This is useful when:

- No attribute reference exists between resources

- The dependency is logical or operational

- Resource creation order matters for validation, provisioning, or compliance reasons

## Demo: EC2 and S3 Bucket Creation Order

This demo shows the behavior difference with and without an explicit dependency:

- Without depends_on
Terraform creates the EC2 instance and the S3 bucket in parallel

- With depends_on
Terraform ensures the S3 bucket is fully created before starting the EC2 instance

<img width="1422" height="530" alt="image" src="https://github.com/user-attachments/assets/2c2720e3-4eee-4f4a-aad1-5e200a9d925e" />

## How Terraform Interprets This

When Terraform processes this configuration:

- It detects the depends_on argument in the EC2 resource

- Terraform waits for the S3 bucket to finish creating

- Only after the bucket is complete does Terraform start the EC2 instance

Even though the EC2 instance does not directly reference the S3 bucket, the explicit dependency forces a sequential creation order.

## Why This Matters

Explicit dependencies help you:

- Control resource creation order

- Prevent race conditions

- Enforce operational or architectural requirements

- Handle edge cases where implicit dependencies are not possible
