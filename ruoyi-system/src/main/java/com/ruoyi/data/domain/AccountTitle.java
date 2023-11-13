package com.ruoyi.data.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会计科目对象 fx_account_titles
 *
 * @author ruoyi
 * @date 2023-11-13
 */
public class AccountTitle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 上一级，0为顶级 */
    @Excel(name = "上一级，0为顶级")
    private Long pid;

    /** 级次1,2,3,4,5 */
    @Excel(name = "级次1,2,3,4,5")
    private Long level;

    /** 科目代码 */
    @Excel(name = "科目代码")
    private String code;

    /** 中文名 */
    @Excel(name = "中文名")
    private String cnName;

    /** 英文名 */
    @Excel(name = "英文名")
    private String enName;

    /** 科目类型asset:资产类,profit:损益类,cost:成本类,common:共同类,ownership:所有者权益类,liabilities:负债类,settlement:结算对象类 */
    @Excel(name = "科目类型asset:资产类,profit:损益类,cost:成本类,common:共同类,ownership:所有者权益类,liabilities:负债类,settlement:结算对象类")
    private String type;

    /** 账页格式amount:金额式,currencyAmount:外币式金额 */
    @Excel(name = "账页格式amount:金额式,currencyAmount:外币式金额")
    private String format;

    /** 助记码 */
    @Excel(name = "助记码")
    private String abb;

    /** 核算币种 */
    @Excel(name = "核算币种")
    private String currency;

    /** 公司ID */
    @Excel(name = "公司ID")
    private Long comId;

    /** 是否是外币核算Y是N否 */
    @Excel(name = "是否是外币核算Y是N否")
    private String isForeign;

    /** 余额方向Y借方N贷方 */
    @Excel(name = "余额方向Y借方N贷方")
    private String isDn;

    /** 是否冻结Y是N否 */
    @Excel(name = "是否冻结Y是N否")
    private String isFreezed;

    /** 是否现金流科目Y是N否 */
    @Excel(name = "是否现金流科目Y是N否")
    private String isCash;

    /** 是否末级科目Y是N否 */
    @Excel(name = "是否末级科目Y是N否")
    private String isLast;

    /** 期末余额 */
    @Excel(name = "期末余额")
    private BigDecimal balance;

    /** 核算币种余额统计 */
    @Excel(name = "核算币种余额统计")
    private BigDecimal currencyBalance;

    /** 年初余额 */
    @Excel(name = "年初余额")
    private BigDecimal yearBegining;

    /** 年初余额(核算币种) */
    @Excel(name = "年初余额(核算币种)")
    private BigDecimal yearBeginingCurrency;

    /** 开户时的余额 */
    @Excel(name = "开户时的余额")
    private BigDecimal accountOpening;

    /** 开户时的余额余额 */
    @Excel(name = "开户时的余额余额")
    private BigDecimal accountOpeningCurrency;

    /** 往来单位是否必填 */
    @Excel(name = "往来单位是否必填")
    private String venderRequired;

    /** 员工是否必填 */
    @Excel(name = "员工是否必填")
    private String clerkRequired;

    /** 部门是否必填 */
    @Excel(name = "部门是否必填")
    private String teamRequired;

    /** 分公司是否必填 */
    @Excel(name = "分公司是否必填")
    private String branchRequired;

    /** 创建人 */
    @Excel(name = "创建人")
    private Long createdBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedTime;

    /** 更新人 */
    @Excel(name = "更新人")
    private Long updatedBy;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setPid(Long pid)
    {
        this.pid = pid;
    }

    public Long getPid()
    {
        return pid;
    }
    public void setLevel(Long level)
    {
        this.level = level;
    }

    public Long getLevel()
    {
        return level;
    }
    public void setCode(String code)
    {
        this.code = code;
    }

    public String getCode()
    {
        return code;
    }
    public void setCnName(String cnName)
    {
        this.cnName = cnName;
    }

    public String getCnName()
    {
        return cnName;
    }
    public void setEnName(String enName)
    {
        this.enName = enName;
    }

    public String getEnName()
    {
        return enName;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setFormat(String format)
    {
        this.format = format;
    }

    public String getFormat()
    {
        return format;
    }
    public void setAbb(String abb)
    {
        this.abb = abb;
    }

    public String getAbb()
    {
        return abb;
    }
    public void setCurrency(String currency)
    {
        this.currency = currency;
    }

    public String getCurrency()
    {
        return currency;
    }
    public void setComId(Long comId)
    {
        this.comId = comId;
    }

    public Long getComId()
    {
        return comId;
    }
    public void setIsForeign(String isForeign)
    {
        this.isForeign = isForeign;
    }

    public String getIsForeign()
    {
        return isForeign;
    }
    public void setIsDn(String isDn)
    {
        this.isDn = isDn;
    }

    public String getIsDn()
    {
        return isDn;
    }
    public void setIsFreezed(String isFreezed)
    {
        this.isFreezed = isFreezed;
    }

    public String getIsFreezed()
    {
        return isFreezed;
    }
    public void setIsCash(String isCash)
    {
        this.isCash = isCash;
    }

    public String getIsCash()
    {
        return isCash;
    }
    public void setIsLast(String isLast)
    {
        this.isLast = isLast;
    }

    public String getIsLast()
    {
        return isLast;
    }
    public void setBalance(BigDecimal balance)
    {
        this.balance = balance;
    }

    public BigDecimal getBalance()
    {
        return balance;
    }
    public void setCurrencyBalance(BigDecimal currencyBalance)
    {
        this.currencyBalance = currencyBalance;
    }

    public BigDecimal getCurrencyBalance()
    {
        return currencyBalance;
    }
    public void setYearBegining(BigDecimal yearBegining)
    {
        this.yearBegining = yearBegining;
    }

    public BigDecimal getYearBegining()
    {
        return yearBegining;
    }
    public void setYearBeginingCurrency(BigDecimal yearBeginingCurrency)
    {
        this.yearBeginingCurrency = yearBeginingCurrency;
    }

    public BigDecimal getYearBeginingCurrency()
    {
        return yearBeginingCurrency;
    }
    public void setAccountOpening(BigDecimal accountOpening)
    {
        this.accountOpening = accountOpening;
    }

    public BigDecimal getAccountOpening()
    {
        return accountOpening;
    }
    public void setAccountOpeningCurrency(BigDecimal accountOpeningCurrency)
    {
        this.accountOpeningCurrency = accountOpeningCurrency;
    }

    public BigDecimal getAccountOpeningCurrency()
    {
        return accountOpeningCurrency;
    }
    public void setVenderRequired(String venderRequired)
    {
        this.venderRequired = venderRequired;
    }

    public String getVenderRequired()
    {
        return venderRequired;
    }
    public void setClerkRequired(String clerkRequired)
    {
        this.clerkRequired = clerkRequired;
    }

    public String getClerkRequired()
    {
        return clerkRequired;
    }
    public void setTeamRequired(String teamRequired)
    {
        this.teamRequired = teamRequired;
    }

    public String getTeamRequired()
    {
        return teamRequired;
    }
    public void setBranchRequired(String branchRequired)
    {
        this.branchRequired = branchRequired;
    }

    public String getBranchRequired()
    {
        return branchRequired;
    }
    public void setCreatedBy(Long createdBy)
    {
        this.createdBy = createdBy;
    }

    public Long getCreatedBy()
    {
        return createdBy;
    }
    public void setCreatedTime(Date createdTime)
    {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime()
    {
        return createdTime;
    }
    public void setUpdatedTime(Date updatedTime)
    {
        this.updatedTime = updatedTime;
    }

    public Date getUpdatedTime()
    {
        return updatedTime;
    }
    public void setUpdatedBy(Long updatedBy)
    {
        this.updatedBy = updatedBy;
    }

    public Long getUpdatedBy()
    {
        return updatedBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("pid", getPid())
                .append("level", getLevel())
                .append("code", getCode())
                .append("cnName", getCnName())
                .append("enName", getEnName())
                .append("type", getType())
                .append("format", getFormat())
                .append("abb", getAbb())
                .append("currency", getCurrency())
                .append("comId", getComId())
                .append("isForeign", getIsForeign())
                .append("isDn", getIsDn())
                .append("isFreezed", getIsFreezed())
                .append("isCash", getIsCash())
                .append("isLast", getIsLast())
                .append("balance", getBalance())
                .append("currencyBalance", getCurrencyBalance())
                .append("yearBegining", getYearBegining())
                .append("yearBeginingCurrency", getYearBeginingCurrency())
                .append("accountOpening", getAccountOpening())
                .append("accountOpeningCurrency", getAccountOpeningCurrency())
                .append("venderRequired", getVenderRequired())
                .append("clerkRequired", getClerkRequired())
                .append("teamRequired", getTeamRequired())
                .append("branchRequired", getBranchRequired())
                .append("createdBy", getCreatedBy())
                .append("createdTime", getCreatedTime())
                .append("updatedTime", getUpdatedTime())
                .append("updatedBy", getUpdatedBy())
                .toString();
    }
}
