	.arch armv8-a
	.text
	.align	2
	.global	sum32, sum64

sum32:
  # x9-x15 is volatile register
  ldr w9, [sp]
  ldr w10, [sp, 8]

  add w0, w0, w1
  add w0, w0, w2
  add w0, w0, w3
  add w0, w0, w4
  add w0, w0, w5
  add w0, w0, w6
  add w0, w0, w7
  add w0, w0, w9
  add w0, w0, w10
  ret

sum64:
  # x9-x15 is volatile register
  ldr x9, [sp]
  ldr x10, [sp, 8]

  add x0, x0, x1
  add x0, x0, x2
  add x0, x0, x3
  add x0, x0, x4
  add x0, x0, x5
  add x0, x0, x6
  add x0, x0, x7
  add x0, x0, x9
  add x0, x0, x10
  ret

