# The Game of Life
**Author:** Manuel E. Topete Ortega

---

Ruby version: 2.7.2

MiniTest: 5.8.4

---

# Running tests:

To run all tests issue the next command:
```
for file in tests/*_test.rb; do
  ruby -Ilib:test $file
done
```

To run a specific file:
`ruby -Ilib:test tests/grid_test.rb`
