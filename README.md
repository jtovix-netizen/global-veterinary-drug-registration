# 全球兽药注册事务管理系统

**Global Veterinary Drug Registration System**

一个现代化的全栈应用，用于管理全球兽药注册法规和申请事务。

## 🌍 支持国家/地区

- 🇨🇳 **中国** (China - CNAS)
- 🇺🇸 **美国** (USA - FDA)
- 🇪🇺 **欧盟** (European Union - EMA)
- 🇯🇵 **日本** (Japan - MHLW)

## 🏗️ 技术栈

### 后端
- **框架**: Python 3.11+ with FastAPI
- **数据库**: PostgreSQL 15+
- **ORM**: SQLAlchemy
- **缓存**: Redis
- **认证**: JWT
- **API 文档**: OpenAPI/Swagger

### 前端
- **框架**: React 18+
- **UI 库**: Ant Design v5
- **状态管理**: Zustand
- **HTTP 客户端**: Axios + TanStack Query
- **构建工具**: Vite

### DevOps
- **容器化**: Docker & Docker Compose
- **CI/CD**: GitHub Actions
- **版本控制**: Git

## 📦 项目结构

```
global-veterinary-drug-registration/
├── backend/                    # 后端服务
│   ├── app/
│   │   ├── api/               # API 路由
│   │   ├── models/            # 数据模型
│   │   ├── schemas/           # 请求/响应模式
│   │   ├── db/                # 数据库配置
│   │   └── core/              # 核心配置
│   ├── requirements.txt        # 依赖
│   ├── .env.example           # 环境变量示例
│   └── main.py                # 入口文件
├── frontend/                   # 前端应用
│   ├── src/
│   │   ├── components/        # React 组件
│   │   ├── App.tsx            # 主应用
│   │   └── styles/            # 全局样式
│   ├── package.json           # npm 依赖
│   └── vite.config.ts         # Vite 配置
├── database/                   # 数据库脚本
│   └── init.sql               # 初始化脚本
├── docker-compose.yml         # Docker 编排
├── docs/                       # 文档
└── .github/workflows/         # GitHub Actions
```

## 🚀 快速开始

### 前置要求
- Docker & Docker Compose
- Python 3.11+ (本地开发)
- Node.js 18+ (本地开发)

### 使用 Docker Compose 启动

```bash
# 1. 克隆仓库
git clone https://github.com/jtovix-netizen/global-veterinary-drug-registration.git
cd global-veterinary-drug-registration

# 2. 启动所有服务
docker-compose up -d

# 3. 访问应用
# 前端: http://localhost:3000
# 后端 API: http://localhost:8000
# API 文档: http://localhost:8000/docs
```

### 本地开发

#### 后端
```bash
cd backend

# 创建虚拟环境
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt

# 配置环境变量
cp .env.example .env

# 启动开发服务器
uvicorn app.main:app --reload
```

#### 前端
```bash
cd frontend

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

## 📚 核心功能

### 1. 法规管理
- 各国兽药注册法规库
- 法规版本管理
- 更新日志和变更追踪

### 2. 产品管理
- 兽药产品信息管理
- 产品分类和属性
- 多国注册状态追踪

### 3. 申请管理
- 注册申请创建和提交
- 申请进度追踪
- 文档管理
- 评审意见管理

### 4. 合规性分析
- 自动化合规性检查
- 多国合规性对比
- 风险识别

### 5. 报告生成
- 自定义报告模板
- 批量报告生成
- 数据导出 (PDF/Excel)

### 6. 提醒系统
- 截止日期提醒
- 法规更新通知
- 申请状态变更通知

## 🗄️ 数据库架构

### 核心表
- `countries` - 国家/地区信息
- `regulations` - 法规信息
- `products` - 兽药产品（计划中）
- `applications` - 注册申请（计划中）
- `application_documents` - 申请文档（计划中）
- `compliance_checks` - 合规性检查（计划中）
- `users` - 用户账户（计划中）
- `roles` - 角色权限（计划中）

详见: [DATABASE.md](docs/DATABASE.md)

## 🔐 安全性

- JWT 令牌认证
- 基于角色的访问控制 (RBAC)
- 环境变量管理敏感信息
- SQL 注入防护
- CORS 配置
- 请求速率限制

## 🧪 测试

```bash
# 后端单元测试
cd backend
pytest tests/ -v

# 前端单元测试
cd frontend
npm run test
```

## 📖 文档

- [API 文档](docs/API.md) - REST API 详细文档
- [数据库设计](docs/DATABASE.md) - 数据库架构和表结构
- [开发指南](docs/SETUP.md) - 本地开发环境设置
- [贡献指南](CONTRIBUTING.md) - 贡献代码指南

## 🤝 贡献

欢迎提交 Pull Request！请参阅 [CONTRIBUTING.md](CONTRIBUTING.md) 了解详情。

## 📄 许可证

MIT License

## 💡 初始数据

系统预装了以下国家的法规数据：

| 国家 | 代码 | 监管机构 | 处理时间 | 费用 |
|------|------|---------|---------|------|
| 中国 | CN | SATCM | 180天 | ¥5,000 |
| 美国 | US | FDA | 360天 | $8,000 |
| 欧盟 | EU | EMA | 210天 | €12,000 |
| 日本 | JP | MHLW | 240天 | ¥400,000 |

## 📞 联系方式

如有问题，请提交 [Issue](https://github.com/jtovix-netizen/global-veterinary-drug-registration/issues)

---

## 🎯 下一步

1. ✅ 克隆仓库并启动项目
2. 📖 阅读开发指南 ([docs/SETUP.md](docs/SETUP.md))
3. 🔗 尝试 API 端点 ([http://localhost:8000/docs](http://localhost:8000/docs))
4. 💻 查看前端应用 ([http://localhost:3000](http://localhost:3000))
5. 🚀 开始开发新功能

祝开发愉快！🎉
