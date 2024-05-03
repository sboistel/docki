---
title: GoHugo
description: Tips & Tricks
---

## Hugo Template

```md
---
title: ""
description: ""

# pre: "<b>X. </b>"
tags: [""]
---
```

```md
---
title: "Architecture"
Description: "Architecture of the AWX platform"
pre: "<b style='opacity: 1'><i class='fa fa-cogs'></i> </b>"
weight: 100
---

{{% children description="true" %}}
```

### Notice

```md
{{% notice warning %}}

Don't forget to to U 2

{{% /notice %}}
```

ref : https://learn.netlify.app/en/shortcodes/notice/

### Images

```md
![](/images/mongo/toto01.png)
```
