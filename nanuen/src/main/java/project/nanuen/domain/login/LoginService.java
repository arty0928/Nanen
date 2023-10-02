package project.nanuen.domain.login;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.nanuen.domain.member.Member;
import project.nanuen.domain.member.MemberRepository;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final MemberRepository memberRepository;

    /**
     * @return null -> 로그인 실패
     */
    public Member login(String loginId, String password) {
        return memberRepository.findByLoginId(loginId)
                .filter(m -> m.getPassword().equals(password))
                .orElse(null);
    }
}
