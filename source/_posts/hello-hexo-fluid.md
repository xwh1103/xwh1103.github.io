---
title: 从零搭建这个 Hexo 静态博客
date: 2026-09-19 09:00:00
updated: 2026-09-19 09:00:00
categories:
  - 技术实践
tags:
  - Hexo
  - Fluid
  - GitHub Pages
index_img: /img/post-hexo.svg
banner_img: /img/post-hexo.svg
excerpt: 使用 Hexo 生成内容、Fluid 负责视觉呈现，再交给 GitHub Actions 自动构建与发布。
---

静态博客的核心思路很简单：**文章写成 Markdown，构建工具把它们变成 HTML，托管平台负责把页面送到读者面前。**

这套博客采用 Hexo、Fluid 和 GitHub Pages。它不需要数据库，也不需要长期运行的服务器。

<!-- more -->

## 为什么选择静态博客

静态站点生成完成后只有 HTML、CSS、JavaScript 和图片，因此有几个直接的好处：

- 部署成本低，GitHub Pages 可以免费托管；
- 页面加载快，安全风险也比动态后台更少；
- 所有文章都保存在自己的 Git 仓库里，方便备份和迁移；
- Markdown 写作体验简单，适合长期积累。

## 本地常用命令

```bash
npm install
npm run server
```

打开 `http://localhost:4000` 就能看到本地预览。

写新文章时执行：

```bash
npx hexo new "文章标题"
```

文章会出现在 `source/_posts` 目录。完成写作后，用下面的命令检查能否正常生成：

```bash
npm run build
```

## 自动发布的工作方式

每次向 GitHub 仓库的 `main` 分支推送代码时，工作流都会执行以下步骤：

1. 安装 Node.js 和项目依赖；
2. 根据仓库名称计算 GitHub Pages 地址；
3. 运行 Hexo，生成 `public` 目录；
4. 将生成结果部署到 GitHub Pages。

> 一次配置，之后只需要专心写 Markdown。

## 下一步

先修改站点名称、作者和联系方式，再替换头图与头像。等基本内容稳定后，可以继续加入评论、站点统计、RSS 和自定义域名。
