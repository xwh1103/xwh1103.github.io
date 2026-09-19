# 拾光笔记：Hexo + Fluid 静态博客

这是一个已经配置好的中文静态博客，采用 **Hexo + Fluid + GitHub Pages**。

## 1. 本地预览

请先安装 Node.js 22（或兼容版本）和 npm，然后在本目录执行：

```bash
npm install
npm run server
```

浏览器打开：`http://localhost:4000`

停止预览时按 `Ctrl + C`。

## 2. 修改个人信息

主要修改两个文件：

- `_config.yml`：站点标题、副标题、描述、作者；
- `_config.fluid.yml`：导航、首页标语、头像、GitHub、邮箱和页脚。

示例中的 `你的名字`、`你的用户名` 和 `hello@example.com` 都需要替换。

## 3. 写一篇新文章

```bash
npx hexo new "我的新文章"
```

打开 `source/_posts/我的新文章.md`，使用 Markdown 写作。建议保留这类头部信息：

```yaml
---
title: 我的新文章
date: 2026-09-19 12:00:00
categories:
  - 技术实践
tags:
  - Hexo
index_img: /img/post-hexo.svg
banner_img: /img/post-hexo.svg
---
```

构建检查：

```bash
npm run build
```

生成的网站位于 `public/`。

## 4. 发布到 GitHub Pages

1. 在 GitHub 新建一个仓库，例如 `my-blog`；
2. 把本目录中的文件提交并推送到仓库的 `main` 分支；
3. 进入仓库 **Settings → Pages**；
4. 在 **Build and deployment → Source** 选择 **GitHub Actions**；
5. 打开 **Actions**，等待 `Deploy Hexo to GitHub Pages` 完成。

工作流会自动判断仓库类型：

- 仓库名为 `用户名.github.io`：发布到 `https://用户名.github.io/`；
- 其他仓库名：发布到 `https://用户名.github.io/仓库名/`。

## 5. 常用命令

| 命令 | 用途 |
|---|---|
| `npm run server` | 本地预览 |
| `npm run build` | 清理并生成静态页面 |
| `npx hexo new "标题"` | 新建文章 |
| `npx hexo new draft "标题"` | 新建草稿 |
| `npx hexo publish "标题"` | 将草稿发布为文章 |

## 6. 博客园同步（可选）

参考教程还包含 Open API 同步博客园。此功能需要博客园的 Client ID、Client Secret 等敏感信息，不应写进仓库。建议等 GitHub Pages 正常发布后，再把凭据放入 GitHub Actions Secrets 中，并单独增加同步工作流。
## 7. 完整操作手册

头像、简介、文章编辑、本地预览和 GitHub Pages 发布等完整说明，请查看：

- [`拾光笔记-完整操作指南.md`](./拾光笔记-完整操作指南.md)
