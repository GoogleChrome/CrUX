---
name: New CrUX metric request
about: Tell us about a new metric you'd like to see included in the report
title: ''
labels: enhancement
assignees: ''

---

**Proposal**
[What exactly is the metric you're proposing?]

**Use cases**
[How do you see this metric being useful in the dataset? Please list.]

**Measurement**
[How is the metric measured? Is it a web standard?]

**Schema**
[How will the data be represented in BigQuery? Sample schema below.]

```
"first_paint": {
  "histogram": {
    "bin": [
      {"start": 0, "end": 100, "density": 0.003},
      {"start": 100, "end": 200, "density": 0.014},
      // …
    ]
  }  
}
```
