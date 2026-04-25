# sync-to-personal.ps1
# 把仓库中的 skill 定义同步到本机个人 skill 目录：
#   D:\GitClone\meal-planner-skill\  ->  $HOME\.cursor\skills\meal-planner-skill\
#
# 同步内容：SKILL.md / README.md / templates/ 等 "skill 定义文件"。
# 排除内容：
#   - .git              （仓库元数据）
#   - user-profile.md   （用户个人档案，本地数据）
#   - dish-library.md   （用户个人菜品库，本地数据）
#   - dish-details.md   （用户个人菜品详情库，本地数据）
#   - meal-plan-*.md    （用户个人食谱，本地数据）
#   - sync-to-personal.ps1（同步脚本本身不需要进个人 skill 目录）
#   - AGENTS.md         （仓库内 agent 指令，与 skill 运行无关）
#
# 用法：
#   pwsh ./sync-to-personal.ps1            # 正常同步
#   pwsh ./sync-to-personal.ps1 -DryRun    # 仅显示将要复制的文件，不实际写入

param(
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'

$src  = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $env:USERPROFILE '.cursor\skills\meal-planner-skill'

Write-Host "Source:      $src"
Write-Host "Destination: $dest"
Write-Host ""

if (-not (Test-Path $dest)) {
    Write-Host "Destination does not exist. Creating..." -ForegroundColor Yellow
    if (-not $DryRun) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }
}

# robocopy 参数：
#   /MIR             镜像（删除目标中源已不存在的文件）
#   /XD .git         排除 .git 目录
#   /XF              排除指定文件名（可重复）
#   /NFL /NDL        简化输出（不列每个文件/目录）
#   /NJH /NJS        不显示 robocopy 头/尾摘要
#   /L               仅列出（dry-run）
$robocopyArgs = @(
    $src, $dest,
    '/MIR',
    '/XD', '.git',
    '/XF', 'user-profile.md',
    '/XF', 'dish-library.md',
    '/XF', 'dish-details.md',
    '/XF', 'meal-plan-*.md',
    '/XF', 'sync-to-personal.ps1',
    '/XF', 'AGENTS.md',
    '/NFL', '/NDL', '/NJH', '/NJS'
)
if ($DryRun) { $robocopyArgs += '/L' }

robocopy @robocopyArgs | Out-Null
$rc = $LASTEXITCODE

# robocopy 退出码语义（0-7 都算成功，8+ 才是真错误）：
#   0 无变化  1 已复制  2 有额外文件  3 = 1+2
#   4 不匹配  5 = 1+4  6 = 2+4  7 = 1+2+4
#   >=8 出错
if ($rc -ge 8) {
    Write-Error "robocopy failed with exit code $rc"
    exit $rc
}

if ($DryRun) {
    Write-Host "[DryRun] Robocopy preview finished (exit code $rc)." -ForegroundColor Cyan
} else {
    Write-Host "Sync OK (robocopy exit code $rc)." -ForegroundColor Green
    Write-Host ""
    Write-Host "Files now in personal skill folder:" -ForegroundColor Green
    Get-ChildItem -Recurse $dest -File |
        ForEach-Object { "  {0,8} {1}" -f $_.Length, $_.FullName.Substring($dest.Length + 1) }
}
