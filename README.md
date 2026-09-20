# 拾光笔记

> 记录技术、设计与生活的微光。

这是 **xwh** 的个人静态博客，使用 [Hexo](https://hexo.io/) 和 [Fluid](https://github.com/fluid-dev/hexo-theme-fluid) 构建，通过 GitHub Actions 自动发布到 GitHub Pages。

- 博客地址：<https://xwh1103.github.io/>
- GitHub 仓库：<https://github.com/xwh1103/xwh1103.github.io>
- 当前分支：`main`
- 本地预览地址：<http://localhost:4000/>

## 技术组成

- Node.js 24
- npm
- Hexo 7
- Fluid 主题
- GitHub Actions
- GitHub Pages

## 快速开始

### 1. 进入博客目录

```powershell
cd "C:\Users\xwh\Documents\Codex\2026-09-19\ji\outputs\hexo-blog"
```

### 2. 安装依赖

首次使用、重新下载项目或删除了 `node_modules` 后执行：

```powershell
npm install
```

日常写文章不需要重复安装依赖。

### 3. 启动本地预览

```powershell
npm run server
```

浏览器打开：<http://localhost:4000/>

停止服务时在 PowerShell 中按 `Ctrl+C`。

## 新建和编辑文章

### 新建文章

```powershell
npm run new -- "文章标题"
```

例如：

```powershell
npm run new -- "2026.9.21-2026.9.27"
```

文章会生成在：

```text
source/_posts/
```

### 文章头部示例

```yaml
---
title: 文章标题
date: 2026-09-20 12:00:00
categories:
  - 生活随笔
tags:
  - 生活记录
index_img: /img/post-life.svg
banner_img: /img/post-life.svg
---
```

其中：

- `index_img`：博客首页文章卡片的封面图；
- `banner_img`：进入文章后顶部的大背景图；
- 图片统一放在 `source/img/` 目录；
- `/img/example.png` 对应本地文件 `source/img/example.png`。

## 本地构建

发布前建议检查网站能否正常生成：

```powershell
npm run build
```

生成结果位于 `public/`。`public/` 是自动生成目录，不需要手动编辑。

如果页面缓存异常，可以执行：

```powershell
npm run clean
npm run server
```

然后在浏览器中按 `Ctrl+F5` 强制刷新。

## 发布到 GitHub Pages

修改文章、图片或配置后，依次执行：

```powershell
git add -A
git commit -m "更新博客文章"
git push
```

命令作用：

| 命令 | 作用 |
|---|---|
| `git add -A` | 把新增、修改和删除的文件加入本次提交 |
| `git commit -m "说明"` | 在本地保存一次版本记录 |
| `git push` | 把版本上传到 GitHub |

推送到 `main` 分支后，`.github/workflows/pages.yml` 会自动：

1. 安装 npm 依赖；
2. 生成 Hexo 静态网站；
3. 部署到 GitHub Pages。

可以在 GitHub 仓库的 **Actions** 页面查看 `Deploy Hexo to GitHub Pages`。绿色对勾表示发布成功。

> GitHub 仓库的 **Settings → Pages → Source** 应设置为 **GitHub Actions**。

## 日常操作流程

```powershell
# 1. 进入博客目录
cd "C:\Users\xwh\Documents\Codex\2026-09-19\ji\outputs\hexo-blog"

# 2. 本地预览
npm run server

# 3. 编辑完成后按 Ctrl+C 停止服务，再检查构建
npm run build

# 4. 查看修改
git status

# 5. 保存并上传
git add -A
git commit -m "更新博客文章"
git push
```


## 一键脚本

项目根目录提供了三个 Windows 快捷脚本：

| 文件 | 用途 |
|---|---|
| `启动博客.cmd` | 启动本地预览 |
| `新建文章.cmd` | 输入标题并创建文章 |
| `生成网站.cmd` | 清理并生成静态网站 |

不想输入命令时，可以直接双击对应脚本。

## 常用检查命令

```powershell
# 查看文件修改状态
git status

# 查看最近 5 次提交
git log --oneline -5

# 查看当前分支
git branch --show-current

# 查看 GitHub 远程地址
git remote -v

# 查看 Node.js 和 npm 版本
node --version
npm --version
```

## SSH 连接测试

仅在 `git push` 连接失败时使用：

```powershell
ssh -T -p 443 -i "C:\Users\xwh\.ssh\id_ed25519_github_xwh1103" -o IdentitiesOnly=yes git@ssh.github.com
```

验证成功时会显示：

```text
Hi xwh1103! You've successfully authenticated, but GitHub does not provide shell access.
```

如果提示输入 `passphrase`，输入创建 SSH 密钥时设置的密码。输入过程中不会显示字符。

> 只能分享带 `.pub` 后缀的公钥，绝对不要分享没有 `.pub` 后缀的私钥。

## 个性化配置

| 内容 | 文件或目录 |
|---|---|
| 网站标题、作者、描述 | `_config.yml` |
| Fluid 外观、头像、简介、导航 | `_config.fluid.yml` |
| 关于页面 | `source/about/index.md` |
| 博客文章 | `source/_posts/` |
| 图片资源 | `source/img/` |
| GitHub Pages 工作流 | `.github/workflows/pages.yml` |

## 项目结构

```text
hexo-blog/
├─ .github/workflows/pages.yml  # GitHub Pages 自动部署
├─ scaffolds/                   # 新文章模板
├─ source/
│  ├─ _posts/                   # 博客文章
│  ├─ about/                    # 关于页面
│  └─ img/                      # 图片资源
├─ themes/fluid/                # Fluid 主题
├─ _config.yml                  # Hexo 网站配置
├─ _config.fluid.yml            # Fluid 主题配置
├─ package.json                 # npm 命令和依赖
├─ package-lock.json            # npm 依赖锁定文件
├─ 启动博客.cmd
├─ 新建文章.cmd
├─ 生成网站.cmd
└─ 拾光笔记-完整操作指南.md
```

## 常见问题

### `npm server` 提示 Unknown command

错误写法：

```powershell
npm server
```

正确写法：

```powershell
npm run server
```

### PowerShell 禁止运行 `npm.ps1` 或 `npx.ps1`

可以使用 `.cmd` 版本：

```powershell
npm.cmd run server
npx.cmd hexo new "文章标题"
```

### 修改后页面没有变化

1. 保存修改过的文件；
2. 重新执行 `npm run build`；
3. 重新执行 `npm run server`；
4. 在浏览器中按 `Ctrl+F5`。

### GitHub Pages 发布失败

进入 GitHub 仓库的 **Actions** 页面，打开带红色叉号的运行记录，查看失败步骤最后几行错误。

### 图片在网上不显示

检查：

- 图片是否放在 `source/img/`；
- Markdown 或配置中的路径是否以 `/img/` 开头；
- 文件名大小写是否完全一致；
- 图片是否已经通过 Git 提交并推送；
- 文件名尽量不要包含中文、空格和特殊字符。

## 注意事项

- 本项目统一使用 **npm**，不要同时混用 pnpm 或 yarn；
- 不需要手动上传 `public/` 文件夹；
- 不需要日常执行 `npm run deploy`；
- 不要把密码、令牌、私钥或其他敏感信息提交到 GitHub；
- 不确定修改是否正确时，先运行 `git status`，不要使用 `git push --force`。

## 详细文档

更多关于头像、简介、文章编辑、图片设置和 GitHub Pages 的说明，请阅读：

- [`拾光笔记-完整操作指南.md`](./拾光笔记-完整操作指南.md)

---

最后更新：2026-09-20
