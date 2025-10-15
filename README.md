# Armbian Actions

通过 **GitHub Actions** 构建官方 Armbian 固件与内核

---

## 📦 内核配置
- 启用 **eBPF** 支持，兼容 **DAE 代理**
- 适配平台：`meson64`、`rockchip64`、`rk35xx`

---

## 🖥️ 支持设备
- 参考 Armbian 官方 [设备列表](https://github.com/armbian/build/tree/main/config/boards)
- 在 **Build-Armbian.yml** 中添加所需设备，实现构建固件

---

## ⚙️ 设备优化

### Nanopc-T4
- **CPU 频率**
  - 小核：1.5GHz
  - 大核：2.0GHz
- **扩展支持**
  - 启用 PCIe 2.1 x4
- **风扇策略**
  - ≥ 45°C → 风扇启动
  - ≥ 65°C → 风扇全速

---

### Rock5C Lite
- **系统优化**
  - 移除 **U-Boot** 对 GPU 的检测，启用 GPU 节点
  - 网络接口：`end*` → `eth0`
- **风扇策略 (vendor)**
  - ≥ 40°C → 40%
  - ≥ 50°C → 55%
  - ≥ 60°C → 75%
  - ≥ 70°C → 88%
  - ≥ 75°C → 100%
- **网络支持**
  - 默认不支持 **WiFi**，需自行安装 [aic8800 驱动](https://github.com/radxa-pkg/aic8800)

---

### Panther-X2
- **CPU 频率**：2.0GHz
- **多媒体支持**：vendor 固件支持 **Jellyfin 硬件转码**
- **网络接口**：`end*` → `eth0`

---

## 🔧 其他修改
- 移除内核版本后缀信息
- 补全 `cpuinfo` 中的 **model name** 信息
- **Aml-s9xx-box** 固件默认适配 **斐讯 N1 盒子**（直接解压写入 U 盘即可）
- 新增命令工具：
  - `armbian-apt`、`armbian-update`、`armbian-sync`
    - [功能截图](https://github.com/Zane-E/Armbian-Actions/blob/main/screenshot/screenshot.png)
    - 用于换源 / 更换内核 / 同步脚本
  - `install-pve` [ `bookworm → Pxvirt 8` `trixie → Pxvirt 9` ]
    - [安装截图](https://github.com/Zane-E/Armbian-Actions/blob/main/screenshot/install-pve.png)
    - 在 **Armbian (ARM64)** 系统上快捷安装 **Pxvirt (Proxmox VE)**

---

## 📖 使用说明
1. Fork 本仓库
2. 编辑 **Build-Armbian.yml**，添加所需设备
3. 触发 GitHub Actions 工作流，等待构建完成
4. 在 Releases 页面下载构建好的固件

---

## 📌 相关链接
- [Armbian 官方仓库](https://github.com/armbian/build)
- [DAE 官方仓库](https://github.com/daeuniverse/dae)
- [PVE 安装教程](https://www.zhou.pp.ua/)
