import SwiftUI

struct MessageItemView: View {

    var message: Message
    var fromSelf: Bool

    var body: some View {
        HStack {
            if fromSelf {
                Spacer()
            }

            VStack(alignment: fromSelf ? .trailing : .leading) {
                Text(message.content)
                Text(
                    message.timestamp.formatted(
                        date: .numeric,
                        time: .shortened
                    )
                )
                .font(.system(size: 9)) // Text
            }
            .padding(12)
            .background(fromSelf ? .siPurple : .siYellow)
            .foregroundStyle(fromSelf ? .white : .black)
            .clipShape(
                .rect(
                    topLeadingRadius: 15,
                    bottomLeadingRadius: fromSelf ? 15 : 0,
                    bottomTrailingRadius: fromSelf ? 0 : 15,
                    topTrailingRadius: 15
                )
            ) // VStack

            if !fromSelf {
                Spacer()
            }
        }
    }
}

#Preview {
    MessageItemView(message: Message(senderID: "A", content: "HALLOHALL", timestamp: .now), fromSelf: true)
}
