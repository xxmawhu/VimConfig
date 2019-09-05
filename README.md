# VimConfig
## 配置

## 插件
### python 自动补全工具
#### 安装
```vim
Plugin 'davidhalter/jedi-vim'
```
#### 配置
* 触发自动补全快捷键 修改为 ctrl+p
```vim
let g:jedi#completions_command = "<C-P>"
```
####  功能
* `\+g` 查找定义 
* `\+r` 重命名 
* `\+d` 查找定义的位置 
