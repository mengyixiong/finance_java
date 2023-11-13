package com.ruoyi.data.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.data.mapper.AccountTitleMapper;
import com.ruoyi.data.domain.AccountTitle;
import com.ruoyi.data.service.IAccountTitleService;

/**
 * 会计科目Service业务层处理
 *
 * @author ruoyi
 * @date 2023-11-13
 */
@Service
public class AccountTitleServiceImpl implements IAccountTitleService
{
    @Autowired
    private AccountTitleMapper accountTitleMapper;

    /**
     * 查询会计科目
     *
     * @param id 会计科目主键
     * @return 会计科目
     */
    @Override
    public AccountTitle selectAccountTitleById(Long id)
    {
        return accountTitleMapper.selectAccountTitleById(id);
    }

    /**
     * 查询会计科目列表
     *
     * @param accountTitle 会计科目
     * @return 会计科目
     */
    @Override
    public List<AccountTitle> selectAccountTitleList(AccountTitle accountTitle)
    {
        return accountTitleMapper.selectAccountTitleList(accountTitle);
    }

    /**
     * 新增会计科目
     *
     * @param accountTitle 会计科目
     * @return 结果
     */
    @Override
    public int insertAccountTitle(AccountTitle accountTitle)
    {
        return accountTitleMapper.insertAccountTitle(accountTitle);
    }

    /**
     * 修改会计科目
     *
     * @param accountTitle 会计科目
     * @return 结果
     */
    @Override
    public int updateAccountTitle(AccountTitle accountTitle)
    {
        return accountTitleMapper.updateAccountTitle(accountTitle);
    }

    /**
     * 批量删除会计科目
     *
     * @param ids 需要删除的会计科目主键
     * @return 结果
     */
    @Override
    public int deleteAccountTitleByIds(Long[] ids)
    {
        return accountTitleMapper.deleteAccountTitleByIds(ids);
    }

    /**
     * 删除会计科目信息
     *
     * @param id 会计科目主键
     * @return 结果
     */
    @Override
    public int deleteAccountTitleById(Long id)
    {
        return accountTitleMapper.deleteAccountTitleById(id);
    }
}
