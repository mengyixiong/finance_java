package com.ruoyi.data.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.data.domain.AccountTitle;
import com.ruoyi.data.service.IAccountTitleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会计科目Controller
 *
 * @author ruoyi
 * @date 2023-11-13
 */
@RestController
@RequestMapping("/data/titles")
public class AccountTitleController extends BaseController
{
    @Autowired
    private IAccountTitleService accountTitleService;

    /**
     * 查询会计科目列表
     */
    @PreAuthorize("@ss.hasPermi('data:titles:list')")
    @GetMapping("/list")
    public TableDataInfo list(AccountTitle accountTitle)
    {
        startPage();
        List<AccountTitle> list = accountTitleService.selectAccountTitleList(accountTitle);
        return getDataTable(list);
    }

    /**
     * 导出会计科目列表
     */
    @PreAuthorize("@ss.hasPermi('data:titles:export')")
    @Log(title = "会计科目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AccountTitle accountTitle)
    {
        List<AccountTitle> list = accountTitleService.selectAccountTitleList(accountTitle);
        ExcelUtil<AccountTitle> util = new ExcelUtil<AccountTitle>(AccountTitle.class);
        util.exportExcel(response, list, "会计科目数据");
    }

    /**
     * 获取会计科目详细信息
     */
    @PreAuthorize("@ss.hasPermi('data:titles:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(accountTitleService.selectAccountTitleById(id));
    }

    /**
     * 新增会计科目
     */
    @PreAuthorize("@ss.hasPermi('data:titles:add')")
    @Log(title = "会计科目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AccountTitle accountTitle)
    {
        return toAjax(accountTitleService.insertAccountTitle(accountTitle));
    }

    /**
     * 修改会计科目
     */
    @PreAuthorize("@ss.hasPermi('data:titles:edit')")
    @Log(title = "会计科目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AccountTitle accountTitle)
    {
        return toAjax(accountTitleService.updateAccountTitle(accountTitle));
    }

    /**
     * 删除会计科目
     */
    @PreAuthorize("@ss.hasPermi('data:titles:remove')")
    @Log(title = "会计科目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(accountTitleService.deleteAccountTitleByIds(ids));
    }
}
