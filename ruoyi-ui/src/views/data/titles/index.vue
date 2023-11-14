<template>
  <div class="app-container">
    <!-- 查询表单 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="上一级，0为顶级" prop="pid">
        <el-input
          v-model="queryParams.pid"
          placeholder="请输入上一级，0为顶级"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="级次1,2,3,4,5" prop="level">
        <el-input
          v-model="queryParams.level"
          placeholder="请输入级次1,2,3,4,5"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="科目代码" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入科目代码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="中文名" prop="cnName">
        <el-input
          v-model="queryParams.cnName"
          placeholder="请输入中文名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="英文名" prop="enName">
        <el-input
          v-model="queryParams.enName"
          placeholder="请输入英文名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="账页格式amount:金额式,currencyAmount:外币式金额" prop="format">
        <el-input
          v-model="queryParams.format"
          placeholder="请输入账页格式amount:金额式,currencyAmount:外币式金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="助记码" prop="abb">
        <el-input
          v-model="queryParams.abb"
          placeholder="请输入助记码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="核算币种" prop="currency">
        <el-input
          v-model="queryParams.currency"
          placeholder="请输入核算币种"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司ID" prop="comId">
        <el-input
          v-model="queryParams.comId"
          placeholder="请输入公司ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否是外币核算Y是N否" prop="isForeign">
        <el-input
          v-model="queryParams.isForeign"
          placeholder="请输入是否是外币核算Y是N否"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="余额方向Y借方N贷方" prop="isDn">
        <el-input
          v-model="queryParams.isDn"
          placeholder="请输入余额方向Y借方N贷方"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否冻结Y是N否" prop="isFreezed">
        <el-input
          v-model="queryParams.isFreezed"
          placeholder="请输入是否冻结Y是N否"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否现金流科目Y是N否" prop="isCash">
        <el-input
          v-model="queryParams.isCash"
          placeholder="请输入是否现金流科目Y是N否"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否末级科目Y是N否" prop="isLast">
        <el-input
          v-model="queryParams.isLast"
          placeholder="请输入是否末级科目Y是N否"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="期末余额" prop="balance">
        <el-input
          v-model="queryParams.balance"
          placeholder="请输入期末余额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="核算币种余额统计" prop="currencyBalance">
        <el-input
          v-model="queryParams.currencyBalance"
          placeholder="请输入核算币种余额统计"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="年初余额" prop="yearBegining">
        <el-input
          v-model="queryParams.yearBegining"
          placeholder="请输入年初余额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="年初余额(核算币种)" prop="yearBeginingCurrency">
        <el-input
          v-model="queryParams.yearBeginingCurrency"
          placeholder="请输入年初余额(核算币种)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开户时的余额" prop="accountOpening">
        <el-input
          v-model="queryParams.accountOpening"
          placeholder="请输入开户时的余额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开户时的余额余额" prop="accountOpeningCurrency">
        <el-input
          v-model="queryParams.accountOpeningCurrency"
          placeholder="请输入开户时的余额余额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="往来单位是否必填" prop="venderRequired">
        <el-input
          v-model="queryParams.venderRequired"
          placeholder="请输入往来单位是否必填"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="员工是否必填" prop="clerkRequired">
        <el-input
          v-model="queryParams.clerkRequired"
          placeholder="请输入员工是否必填"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门是否必填" prop="teamRequired">
        <el-input
          v-model="queryParams.teamRequired"
          placeholder="请输入部门是否必填"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分公司是否必填" prop="branchRequired">
        <el-input
          v-model="queryParams.branchRequired"
          placeholder="请输入分公司是否必填"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建人" prop="createdBy">
        <el-input
          v-model="queryParams.createdBy"
          placeholder="请输入创建人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createdTime">
        <el-date-picker clearable
                        v-model="queryParams.createdTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="修改时间" prop="updatedTime">
        <el-date-picker clearable
                        v-model="queryParams.updatedTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择修改时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="更新人" prop="updatedBy">
        <el-input
          v-model="queryParams.updatedBy"
          placeholder="请输入更新人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!--  操作按钮栏   -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['data:titles:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['data:titles:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['data:titles:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['data:titles:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表   -->
    <el-table v-loading="loading" :data="titlesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['data:titles:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['data:titles:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="科目代码" align="center" width="120" prop="code">
        <template slot="header" slot-scope="scope">
          <el-row>科目代码</el-row>
          <el-row>
            <el-input
              class="input-filter"
              v-model="search"
              size="mini"
              placeholder="输入关键字搜索"/>
          </el-row>
        </template>
      </el-table-column>
      <el-table-column label="中文名" align="center" prop="cnName"/>
      <el-table-column label="英文名" align="center" prop="enName"/>
      <el-table-column label="科目类型" align="center" prop="type"/>
      <el-table-column label="账页格式" align="center" prop="format"/>
      <el-table-column label="助记码" align="center" prop="abb"/>
      <el-table-column label="核算币种" align="center" prop="currency"/>
      <el-table-column label="公司ID" align="center" prop="comId"/>
      <el-table-column label="外币核算" align="center" prop="isForeign">
        <template slot-scope="scope">
          {{ scope.row.isForeign|is }}
        </template>
      </el-table-column>
      <el-table-column label="余额方向" align="center" prop="isDn">
        <template slot-scope="scope">
          <el-button type="success" size="mini" v-if="scope.row.isDn === 'Y'">借方</el-button>
          <el-button type="danger" size="mini" v-else>贷方</el-button>
        </template>
      </el-table-column>
      <el-table-column label="是否冻结" align="center" prop="isFreezed">
        <template slot-scope="scope">
          {{ scope.row.isFreezed|is }}
        </template>
      </el-table-column>
      <el-table-column label="现金流科目" align="center" prop="isCash">
        <template slot-scope="scope">
          {{ scope.row.isCash|is }}
        </template>
      </el-table-column>
      <el-table-column label="末级科目" align="center" prop="isLast">
        <template slot-scope="scope">
          {{ scope.row.isLast|is }}
        </template>
      </el-table-column>
      <el-table-column label="期末余额" align="center" prop="balance"/>
      <el-table-column label="核算币种余额统计" align="center" prop="currencyBalance"/>
      <el-table-column label="年初余额" align="center" prop="yearBegining"/>
      <el-table-column label="年初余额(核算币种)" align="center" prop="yearBeginingCurrency"/>
      <el-table-column label="开户时的余额" align="center" prop="accountOpening"/>
      <el-table-column label="开户时的余额余额" align="center" prop="accountOpeningCurrency"/>
      <el-table-column label="往来单位" align="center" prop="venderRequired">
        <template slot-scope="scope">
          {{ scope.row.venderRequired|is }}
        </template>
      </el-table-column>
      <el-table-column label="员工" align="center" prop="clerkRequired">
        <template slot-scope="scope">
          {{ scope.row.clerkRequired|is }}
        </template>
      </el-table-column>
      <el-table-column label="部门" align="center" prop="teamRequired">
        <template slot-scope="scope">
          {{ scope.row.teamRequired|is }}
        </template>
      </el-table-column>
      <el-table-column label="分公司" align="center" prop="branchRequired">
        <template slot-scope="scope">
          {{ scope.row.branchRequired|is }}
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createdBy"/>
      <el-table-column label="创建时间" align="center" prop="createdTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="修改时间" align="center" prop="updatedTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updatedTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新人" align="center" prop="updatedBy"/>

    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改会计科目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="上一级，0为顶级" prop="pid">
          <el-input v-model="form.pid" placeholder="请输入上一级，0为顶级"/>
        </el-form-item>
        <el-form-item label="级次1,2,3,4,5" prop="level">
          <el-input v-model="form.level" placeholder="请输入级次1,2,3,4,5"/>
        </el-form-item>
        <el-form-item label="科目代码" prop="code">
          <el-input v-model="form.code" placeholder="请输入科目代码"/>
        </el-form-item>
        <el-form-item label="中文名" prop="cnName">
          <el-input v-model="form.cnName" placeholder="请输入中文名"/>
        </el-form-item>
        <el-form-item label="英文名" prop="enName">
          <el-input v-model="form.enName" placeholder="请输入英文名"/>
        </el-form-item>
        <el-form-item label="账页格式" prop="format">
          <el-input v-model="form.format" placeholder="请输入账页格式"/>
        </el-form-item>
        <el-form-item label="助记码" prop="abb">
          <el-input v-model="form.abb" placeholder="请输入助记码"/>
        </el-form-item>
        <el-form-item label="核算币种" prop="currency">
          <el-input v-model="form.currency" placeholder="请输入核算币种"/>
        </el-form-item>
        <el-form-item label="公司ID" prop="comId">
          <el-input v-model="form.comId" placeholder="请输入公司ID"/>
        </el-form-item>
        <el-form-item label="是否是外币核算Y是N否" prop="isForeign">
          <el-input v-model="form.isForeign" placeholder="请输入是否是外币核算Y是N否"/>
        </el-form-item>
        <el-form-item label="余额方向Y借方N贷方" prop="isDn">
          <el-input v-model="form.isDn" placeholder="请输入余额方向Y借方N贷方"/>
        </el-form-item>
        <el-form-item label="是否冻结Y是N否" prop="isFreezed">
          <el-input v-model="form.isFreezed" placeholder="请输入是否冻结Y是N否"/>
        </el-form-item>
        <el-form-item label="是否现金流科目Y是N否" prop="isCash">
          <el-input v-model="form.isCash" placeholder="请输入是否现金流科目Y是N否"/>
        </el-form-item>
        <el-form-item label="是否末级科目Y是N否" prop="isLast">
          <el-input v-model="form.isLast" placeholder="请输入是否末级科目Y是N否"/>
        </el-form-item>
        <el-form-item label="期末余额" prop="balance">
          <el-input v-model="form.balance" placeholder="请输入期末余额"/>
        </el-form-item>
        <el-form-item label="核算币种余额统计" prop="currencyBalance">
          <el-input v-model="form.currencyBalance" placeholder="请输入核算币种余额统计"/>
        </el-form-item>
        <el-form-item label="年初余额" prop="yearBegining">
          <el-input v-model="form.yearBegining" placeholder="请输入年初余额"/>
        </el-form-item>
        <el-form-item label="年初余额(核算币种)" prop="yearBeginingCurrency">
          <el-input v-model="form.yearBeginingCurrency" placeholder="请输入年初余额(核算币种)"/>
        </el-form-item>
        <el-form-item label="开户时的余额" prop="accountOpening">
          <el-input v-model="form.accountOpening" placeholder="请输入开户时的余额"/>
        </el-form-item>
        <el-form-item label="开户时的余额余额" prop="accountOpeningCurrency">
          <el-input v-model="form.accountOpeningCurrency" placeholder="请输入开户时的余额余额"/>
        </el-form-item>
        <el-form-item label="往来单位是否必填" prop="venderRequired">
          <el-input v-model="form.venderRequired" placeholder="请输入往来单位是否必填"/>
        </el-form-item>
        <el-form-item label="员工是否必填" prop="clerkRequired">
          <el-input v-model="form.clerkRequired" placeholder="请输入员工是否必填"/>
        </el-form-item>
        <el-form-item label="部门是否必填" prop="teamRequired">
          <el-input v-model="form.teamRequired" placeholder="请输入部门是否必填"/>
        </el-form-item>
        <el-form-item label="分公司是否必填" prop="branchRequired">
          <el-input v-model="form.branchRequired" placeholder="请输入分公司是否必填"/>
        </el-form-item>
        <el-form-item label="创建人" prop="createdBy">
          <el-input v-model="form.createdBy" placeholder="请输入创建人"/>
        </el-form-item>
        <el-form-item label="创建时间" prop="createdTime">
          <el-date-picker clearable
                          v-model="form.createdTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="修改时间" prop="updatedTime">
          <el-date-picker clearable
                          v-model="form.updatedTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择修改时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="更新人" prop="updatedBy">
          <el-input v-model="form.updatedBy" placeholder="请输入更新人"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listTitles, getTitles, delTitles, addTitles, updateTitles} from "@/api/data/titles";

export default {
  name: "Titles",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: false,
      // 总条数
      total: 0,
      // 会计科目表格数据
      titlesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pid: null,
        level: null,
        code: null,
        cnName: null,
        enName: null,
        type: null,
        format: null,
        abb: null,
        currency: null,
        comId: null,
        isForeign: null,
        isDn: null,
        isFreezed: null,
        isCash: null,
        isLast: null,
        balance: null,
        currencyBalance: null,
        yearBegining: null,
        yearBeginingCurrency: null,
        accountOpening: null,
        accountOpeningCurrency: null,
        venderRequired: null,
        clerkRequired: null,
        teamRequired: null,
        branchRequired: null,
        createdBy: null,
        createdTime: null,
        updatedTime: null,
        updatedBy: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        pid: [
          {required: true, message: "上一级，0为顶级不能为空", trigger: "blur"}
        ],
        level: [
          {required: true, message: "级次1,2,3,4,5不能为空", trigger: "blur"}
        ],
        code: [
          {required: true, message: "科目代码不能为空", trigger: "blur"}
        ],
        cnName: [
          {required: true, message: "中文名不能为空", trigger: "blur"}
        ],
        type: [
          {
            required: true,
            message: "科目类型asset:资产类,profit:损益类,cost:成本类,common:共同类,ownership:所有者权益类,liabilities:负债类,settlement:结算对象类不能为空",
            trigger: "change"
          }
        ],
        format: [
          {required: true, message: "账页格式amount:金额式,currencyAmount:外币式金额不能为空", trigger: "blur"}
        ],
        currency: [
          {required: true, message: "核算币种不能为空", trigger: "blur"}
        ],
        comId: [
          {required: true, message: "公司ID不能为空", trigger: "blur"}
        ],
        createdBy: [
          {required: true, message: "创建人不能为空", trigger: "blur"}
        ],
        updatedBy: [
          {required: true, message: "更新人不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询会计科目列表 */
    getList() {
      this.loading = true;
      listTitles(this.queryParams).then(response => {
        this.titlesList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        pid: null,
        level: null,
        code: null,
        cnName: null,
        enName: null,
        type: null,
        format: null,
        abb: null,
        currency: null,
        comId: null,
        isForeign: null,
        isDn: null,
        isFreezed: null,
        isCash: null,
        isLast: null,
        balance: null,
        currencyBalance: null,
        yearBegining: null,
        yearBeginingCurrency: null,
        accountOpening: null,
        accountOpeningCurrency: null,
        venderRequired: null,
        clerkRequired: null,
        teamRequired: null,
        branchRequired: null,
        createdBy: null,
        createdTime: null,
        updatedTime: null,
        updatedBy: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加会计科目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTitles(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会计科目";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTitles(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTitles(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除会计科目编号为"' + ids + '"的数据项？').then(function () {
        return delTitles(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('data/titles/export', {
        ...this.queryParams
      }, `titles_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

<style scoped>
.input-filter {
  padding: 0;
}

</style>
